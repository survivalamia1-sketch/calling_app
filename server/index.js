const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors');
const { v4: uuidv4 } = require('uuid');

const app = express();
const server = http.createServer(app);
const io = socketIo(server, {
  cors: {
    origin: process.env.CLIENT_URL || 'http://localhost:3000',
    methods: ['GET', 'POST']
  }
});

app.use(cors());
app.use(express.json());

// Store active rooms and participants
const rooms = new Map();
const users = new Map();

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok', rooms: rooms.size, users: users.size });
});

// Create a new room
app.post('/api/room/create', (req, res) => {
  const roomId = uuidv4();
  rooms.set(roomId, {
    id: roomId,
    participants: [],
    createdAt: new Date()
  });
  res.json({ roomId });
});

// Socket.io connection handling
io.on('connection', (socket) => {
  console.log(`User connected: ${socket.id}`);

  // Join a room
  socket.on('join-room', ({ roomId, userName }) => {
    console.log(`${userName} (${socket.id}) joining room: ${roomId}`);

    socket.join(roomId);

    // Store user info
    users.set(socket.id, {
      id: socket.id,
      name: userName,
      roomId: roomId
    });

    // Update room participants
    if (!rooms.has(roomId)) {
      rooms.set(roomId, {
        id: roomId,
        participants: [],
        createdAt: new Date()
      });
    }

    const room = rooms.get(roomId);
    room.participants.push({
      id: socket.id,
      name: userName
    });

    // Notify others in the room
    socket.to(roomId).emit('user-joined', {
      userId: socket.id,
      userName: userName
    });

    // Send current participants to the new user
    socket.emit('room-users', room.participants.filter(p => p.id !== socket.id));
  });

  // WebRTC signaling - offer
  socket.on('offer', ({ offer, to }) => {
    console.log(`Sending offer from ${socket.id} to ${to}`);
    socket.to(to).emit('offer', {
      offer,
      from: socket.id
    });
  });

  // WebRTC signaling - answer
  socket.on('answer', ({ answer, to }) => {
    console.log(`Sending answer from ${socket.id} to ${to}`);
    socket.to(to).emit('answer', {
      answer,
      from: socket.id
    });
  });

  // WebRTC signaling - ICE candidate
  socket.on('ice-candidate', ({ candidate, to }) => {
    socket.to(to).emit('ice-candidate', {
      candidate,
      from: socket.id
    });
  });

  // Chat message
  socket.on('chat-message', ({ message, roomId }) => {
    const user = users.get(socket.id);
    if (user) {
      io.to(roomId).emit('chat-message', {
        message,
        userName: user.name,
        userId: socket.id,
        timestamp: new Date().toISOString()
      });
    }
  });

  // Toggle video
  socket.on('toggle-video', ({ roomId, enabled }) => {
    const user = users.get(socket.id);
    if (user) {
      socket.to(roomId).emit('user-video-toggle', {
        userId: socket.id,
        enabled
      });
    }
  });

  // Toggle audio
  socket.on('toggle-audio', ({ roomId, enabled }) => {
    const user = users.get(socket.id);
    if (user) {
      socket.to(roomId).emit('user-audio-toggle', {
        userId: socket.id,
        enabled
      });
    }
  });

  // Screen sharing
  socket.on('start-screen-share', ({ roomId }) => {
    const user = users.get(socket.id);
    if (user) {
      socket.to(roomId).emit('user-screen-share-started', {
        userId: socket.id,
        userName: user.name
      });
    }
  });

  socket.on('stop-screen-share', ({ roomId }) => {
    socket.to(roomId).emit('user-screen-share-stopped', {
      userId: socket.id
    });
  });

  // Disconnect
  socket.on('disconnect', () => {
    console.log(`User disconnected: ${socket.id}`);

    const user = users.get(socket.id);
    if (user) {
      const { roomId, name } = user;

      // Remove from room
      if (rooms.has(roomId)) {
        const room = rooms.get(roomId);
        room.participants = room.participants.filter(p => p.id !== socket.id);

        // Delete room if empty
        if (room.participants.length === 0) {
          rooms.delete(roomId);
        }

        // Notify others
        socket.to(roomId).emit('user-left', {
          userId: socket.id,
          userName: name
        });
      }

      users.delete(socket.id);
    }
  });
});

const PORT = process.env.PORT || 5000;
server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
