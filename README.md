# Video Calling App

A full-featured video calling application similar to Zoom, built with React, TypeScript, WebRTC, and Socket.io.

## Features

- 📹 **HD Video Calling** - High-quality peer-to-peer video calls
- 🎤 **Crystal Clear Audio** - Real-time audio communication
- 🖥️ **Screen Sharing** - Share your screen with participants
- 💬 **Live Chat** - Text messaging during calls
- 👥 **Multi-participant Support** - Support for multiple users in a room
- 🎨 **Modern UI** - Clean and intuitive user interface
- 📱 **Responsive Design** - Works on desktop and mobile devices
- 🔒 **Secure** - WebRTC encrypted peer-to-peer connections

## Tech Stack

### Frontend
- React 18 with TypeScript
- WebRTC for video/audio streaming
- Socket.io Client for real-time signaling
- React Router for navigation
- CSS3 for styling

### Backend
- Node.js with Express
- Socket.io for WebSocket connections
- UUID for room ID generation

## Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Modern web browser with WebRTC support (Chrome, Firefox, Safari, Edge)

## Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd calling_app
```

2. Install dependencies for both server and client:
```bash
npm run install-all
```

Or manually:
```bash
# Install server dependencies
npm install

# Install client dependencies
cd client
npm install
cd ..
```

## Running the Application

### Development Mode

Run both server and client concurrently:
```bash
npm run dev
```

Or run them separately:

**Terminal 1 - Start the server:**
```bash
npm run server
```

**Terminal 2 - Start the client:**
```bash
npm run client
```

The server will run on `http://localhost:5000` and the client on `http://localhost:3000`.

### Production Build

Build the client for production:
```bash
npm run build
```

This creates an optimized production build in the `client/build` directory.

## Usage

1. **Create a Meeting**
   - Enter your name on the home page
   - Click "Create New Meeting"
   - Share the Room ID with participants

2. **Join a Meeting**
   - Enter your name
   - Enter the Room ID you received
   - Click "Join Meeting"

3. **During the Meeting**
   - Toggle video: Click the video button
   - Toggle audio: Click the microphone button
   - Share screen: Click the screen share button
   - Open chat: Click the chat button
   - Leave meeting: Click the leave button

## Project Structure

```
calling_app/
├── server/
│   └── index.js              # Express + Socket.io server
├── client/
│   ├── public/
│   │   └── index.html        # HTML template
│   ├── src/
│   │   ├── components/       # React components
│   │   │   ├── Chat.tsx
│   │   │   ├── Controls.tsx
│   │   │   └── VideoGrid.tsx
│   │   ├── pages/           # Page components
│   │   │   ├── Home.tsx
│   │   │   └── Room.tsx
│   │   ├── services/        # Services
│   │   │   ├── socket.ts
│   │   │   └── webrtc.ts
│   │   ├── App.tsx
│   │   └── index.tsx
│   └── package.json
├── package.json
└── README.md
```

## Configuration

### Environment Variables

Create a `.env` file in the root directory for server configuration:

```env
PORT=5000
CLIENT_URL=http://localhost:3000
```

Create a `.env` file in the `client` directory for client configuration:

```env
REACT_APP_SERVER_URL=http://localhost:5000
```

## Features in Detail

### WebRTC Peer-to-Peer Communication
- Establishes direct peer-to-peer connections between users
- Uses STUN servers for NAT traversal
- Supports multiple simultaneous connections

### Socket.io Signaling
- Handles WebRTC signaling (offer/answer/ICE candidates)
- Manages room creation and participant tracking
- Real-time event notifications

### Video Controls
- Toggle camera on/off
- Toggle microphone on/off
- Visual indicators for muted participants

### Screen Sharing
- Share your entire screen or specific windows
- Automatic stop when sharing ends
- Real-time notifications to participants

### Chat System
- Real-time text messaging
- Timestamps on messages
- Scrollable message history
- User identification

## Browser Compatibility

- Chrome/Chromium (Recommended)
- Firefox
- Safari (14+)
- Edge (Chromium-based)

## Known Limitations

- Requires HTTPS in production for camera/microphone access
- Screen sharing may require additional permissions
- Maximum recommended participants: 4-6 for optimal performance
- TURN server may be needed for some network configurations

## Troubleshooting

### Camera/Microphone Access Denied
- Check browser permissions
- Ensure you're using HTTPS (required for production)
- Try a different browser

### Cannot Connect to Room
- Check if the server is running
- Verify the server URL in environment variables
- Check firewall settings

### Poor Video Quality
- Check your internet connection
- Reduce number of participants
- Lower video resolution in browser settings

## Future Enhancements

- [ ] Recording functionality
- [ ] Virtual backgrounds
- [ ] Hand raise feature
- [ ] Waiting room
- [ ] User authentication
- [ ] Persistent rooms
- [ ] File sharing
- [ ] Breakout rooms
- [ ] Grid/speaker view toggle

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - feel free to use this project for personal or commercial purposes.

## Support

For issues and questions, please open an issue on the GitHub repository.

---

Built with ❤️ using React, WebRTC, and Socket.io
