package webrtc

import (
	"log"
	"sync"

	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/gorilla/websocket"
)

type Message struct {
	Type    string      `json:"type"`
	RoomID  string      `json:"room_id"`
	UserID  string      `json:"user_id"`
	Payload interface{} `json:"payload"`
	To      string      `json:"to,omitempty"`
}

type Room struct {
	ID          string
	Clients     map[*Client]bool
	mu          sync.RWMutex
}

type Client struct {
	ID     string
	RoomID string
	Conn   *websocket.Conn
	Send   chan []byte
}

type Hub struct {
	Rooms      map[string]*Room
	Register   chan *Client
	Unregister chan *Client
	Broadcast  chan *Message
	mu         sync.RWMutex
}

var upgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
	CheckOrigin: func(r *http.Request) bool {
		return true // Allow all origins for development
	},
}

func NewHub() *Hub {
	return &Hub{
		Rooms:      make(map[string]*Room),
		Register:   make(chan *Client),
		Unregister: make(chan *Client),
		Broadcast:  make(chan *Message),
	}
}

func (h *Hub) Run() {
	for {
		select {
		case client := <-h.Register:
			h.mu.Lock()
			room, exists := h.Rooms[client.RoomID]
			if !exists {
				room = &Room{
					ID:      client.RoomID,
					Clients: make(map[*Client]bool),
				}
				h.Rooms[client.RoomID] = room
			}
			room.mu.Lock()
			room.Clients[client] = true
			room.mu.Unlock()
			h.mu.Unlock()

			log.Printf("Client %s joined room %s. Total clients in room: %d", client.ID, client.RoomID, len(room.Clients))

			// Notify others in the room
			h.notifyRoomUsers(client.RoomID, client.ID)

		case client := <-h.Unregister:
			h.mu.RLock()
			room, exists := h.Rooms[client.RoomID]
			h.mu.RUnlock()

			if exists {
				room.mu.Lock()
				if _, ok := room.Clients[client]; ok {
					delete(room.Clients, client)
					close(client.Send)

					log.Printf("Client %s left room %s. Remaining clients: %d", client.ID, client.RoomID, len(room.Clients))

					// If room is empty, remove it
					if len(room.Clients) == 0 {
						h.mu.Lock()
						delete(h.Rooms, client.RoomID)
						h.mu.Unlock()
						log.Printf("Room %s deleted (no clients)", client.RoomID)
					}
				}
				room.mu.Unlock()
			}

		case message := <-h.Broadcast:
			h.mu.RLock()
			room, exists := h.Rooms[message.RoomID]
			h.mu.RUnlock()

			if exists {
				room.mu.RLock()
				for client := range room.Clients {
					// If message has a specific recipient, only send to that client
					if message.To != "" && client.ID != message.To {
						continue
					}
					// Don't send back to sender
					if client.ID == message.UserID {
						continue
					}

					select {
					case client.Send <- []byte(message.Type):
						// Message sent successfully
					default:
						// Client's send channel is full, close it
						close(client.Send)
						delete(room.Clients, client)
					}
				}
				room.mu.RUnlock()
			}
		}
	}
}

func (h *Hub) notifyRoomUsers(roomID, newUserID string) {
	h.mu.RLock()
	room, exists := h.Rooms[roomID]
	h.mu.RUnlock()

	if !exists {
		return
	}

	room.mu.RLock()
	defer room.mu.RUnlock()

	// Send list of existing users to the new user
	for client := range room.Clients {
		if client.ID != newUserID {
			message := &Message{
				Type:   "user-joined",
				RoomID: roomID,
				UserID: client.ID,
			}
			h.Broadcast <- message
		}
	}
}

// HandleWebSocket handles WebSocket connections for WebRTC signaling
func HandleWebSocket(hub *Hub) gin.HandlerFunc {
	return func(c *gin.Context) {
		roomID := c.Query("room_id")
		userID := c.Query("user_id")

		if roomID == "" || userID == "" {
			c.JSON(http.StatusBadRequest, gin.H{"error": "room_id and user_id are required"})
			return
		}

		conn, err := upgrader.Upgrade(c.Writer, c.Request, nil)
		if err != nil {
			log.Printf("WebSocket upgrade error: %v", err)
			return
		}

		client := &Client{
			ID:     userID,
			RoomID: roomID,
			Conn:   conn,
			Send:   make(chan []byte, 256),
		}

		hub.Register <- client

		// Start goroutines for reading and writing
		go client.writePump()
		go client.readPump(hub)
	}
}

func (c *Client) readPump(hub *Hub) {
	defer func() {
		hub.Unregister <- c
		c.Conn.Close()
	}()

	for {
		var msg Message
		err := c.Conn.ReadJSON(&msg)
		if err != nil {
			if websocket.IsUnexpectedCloseError(err, websocket.CloseGoingAway, websocket.CloseAbnormalClosure) {
				log.Printf("WebSocket error: %v", err)
			}
			break
		}

		msg.RoomID = c.RoomID
		msg.UserID = c.ID

		// Forward the message to appropriate recipients
		hub.Broadcast <- &msg
	}
}

func (c *Client) writePump() {
	defer c.Conn.Close()

	for message := range c.Send {
		err := c.Conn.WriteMessage(websocket.TextMessage, message)
		if err != nil {
			log.Printf("Write error: %v", err)
			return
		}
	}
}

// GetRoomInfo returns information about a specific room
func (h *Hub) GetRoomInfo(roomID string) map[string]interface{} {
	h.mu.RLock()
	defer h.mu.RUnlock()

	room, exists := h.Rooms[roomID]
	if !exists {
		return nil
	}

	room.mu.RLock()
	defer room.mu.RUnlock()

	users := make([]string, 0, len(room.Clients))
	for client := range room.Clients {
		users = append(users, client.ID)
	}

	return map[string]interface{}{
		"room_id":         roomID,
		"participant_count": len(users),
		"participants":    users,
	}
}

// Handler for room info endpoint
func GetRoomInfoHandler(hub *Hub) gin.HandlerFunc {
	return func(c *gin.Context) {
		roomID := c.Param("id")

		_, err := uuid.Parse(roomID)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid room ID"})
			return
		}

		info := hub.GetRoomInfo(roomID)
		if info == nil {
			c.JSON(http.StatusNotFound, gin.H{"error": "Room not found or no active connections"})
			return
		}

		c.JSON(http.StatusOK, info)
	}
}

// BroadcastToRoom broadcasts a message to all clients in a room
func (h *Hub) BroadcastToRoom(roomID uuid.UUID, messageType string, data interface{}) {
	h.mu.RLock()
	room, exists := h.Rooms[roomID.String()]
	h.mu.RUnlock()

	if !exists {
		log.Printf("Room %s not found for broadcast", roomID)
		return
	}

	room.mu.RLock()
	defer room.mu.RUnlock()

	// Send to all clients in the room
	for client := range room.Clients {
		select {
		case client.Send <- []byte(messageType):
			log.Printf("Broadcast '%s' to client %s in room %s", messageType, client.ID, roomID)
		default:
			log.Printf("Failed to send broadcast to client %s", client.ID)
		}
	}
}
