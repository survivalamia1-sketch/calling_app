package signaling

import (
	"encoding/json"
	"log"
	"sync"
)

// Hub maintains active connections and rooms
type Hub struct {
	rooms      map[string]*Room
	register   chan *Client
	unregister chan *Client
	mu         sync.RWMutex
}

// Room represents a meeting room
type Room struct {
	ID      string
	Clients map[string]*Client
	mu      sync.RWMutex
}

// Message represents a signaling message
type Message struct {
	Type    string          `json:"type"`
	From    string          `json:"from,omitempty"`
	To      string          `json:"to,omitempty"`
	RoomID  string          `json:"room_id,omitempty"`
	Payload json.RawMessage `json:"payload,omitempty"`
}

func NewHub() *Hub {
	return &Hub{
		rooms:      make(map[string]*Room),
		register:   make(chan *Client),
		unregister: make(chan *Client),
	}
}

func (h *Hub) Register() chan<- *Client {
	return h.register
}

func (h *Hub) Unregister() chan<- *Client {
	return h.unregister
}

func (h *Hub) Run() {
	for {
		select {
		case client := <-h.register:
			h.registerClient(client)

		case client := <-h.unregister:
			h.unregisterClient(client)
		}
	}
}

func (h *Hub) registerClient(client *Client) {
	h.mu.Lock()
	defer h.mu.Unlock()

	room, exists := h.rooms[client.RoomID]
	if !exists {
		room = &Room{
			ID:      client.RoomID,
			Clients: make(map[string]*Client),
		}
		h.rooms[client.RoomID] = room
	}

	room.mu.Lock()
	room.Clients[client.ID] = client
	room.mu.Unlock()

	log.Printf("Client %s joined room %s. Total clients in room: %d",
		client.ID, client.RoomID, len(room.Clients))

	// Notify other clients about the new peer
	h.broadcastToRoom(client.RoomID, Message{
		Type:   "peer-joined",
		From:   client.ID,
		RoomID: client.RoomID,
	}, client.ID)

	// Send list of existing peers to the new client
	peerIDs := make([]string, 0)
	room.mu.RLock()
	for id := range room.Clients {
		if id != client.ID {
			peerIDs = append(peerIDs, id)
		}
	}
	room.mu.RUnlock()

	if len(peerIDs) > 0 {
		payload, _ := json.Marshal(map[string]interface{}{
			"peers": peerIDs,
		})
		client.send <- Message{
			Type:    "existing-peers",
			RoomID:  client.RoomID,
			Payload: payload,
		}
	}
}

func (h *Hub) unregisterClient(client *Client) {
	h.mu.Lock()
	defer h.mu.Unlock()

	room, exists := h.rooms[client.RoomID]
	if !exists {
		return
	}

	room.mu.Lock()
	if _, ok := room.Clients[client.ID]; ok {
		delete(room.Clients, client.ID)
		close(client.send)
	}
	room.mu.Unlock()

	log.Printf("Client %s left room %s. Remaining clients: %d",
		client.ID, client.RoomID, len(room.Clients))

	// Notify other clients about peer leaving
	h.broadcastToRoom(client.RoomID, Message{
		Type:   "peer-left",
		From:   client.ID,
		RoomID: client.RoomID,
	}, "")

	// Remove room if empty
	if len(room.Clients) == 0 {
		delete(h.rooms, client.RoomID)
		log.Printf("Room %s is now empty and removed", client.RoomID)
	}
}

func (h *Hub) HandleMessage(client *Client, msg Message) {
	switch msg.Type {
	case "offer", "answer", "ice-candidate":
		// Forward WebRTC signaling messages
		h.sendToClient(client.RoomID, msg.To, msg)

	case "chat":
		// Broadcast chat message to all in room
		h.broadcastToRoom(client.RoomID, msg, client.ID)

	default:
		log.Printf("Unknown message type: %s from client %s", msg.Type, client.ID)
	}
}

func (h *Hub) sendToClient(roomID, clientID string, msg Message) {
	h.mu.RLock()
	room, exists := h.rooms[roomID]
	h.mu.RUnlock()

	if !exists {
		return
	}

	room.mu.RLock()
	targetClient, ok := room.Clients[clientID]
	room.mu.RUnlock()

	if ok {
		select {
		case targetClient.send <- msg:
		default:
			// Client's send channel is full, skip
			log.Printf("Failed to send message to client %s", clientID)
		}
	}
}

func (h *Hub) broadcastToRoom(roomID string, msg Message, excludeClient string) {
	h.mu.RLock()
	room, exists := h.rooms[roomID]
	h.mu.RUnlock()

	if !exists {
		return
	}

	room.mu.RLock()
	defer room.mu.RUnlock()

	for id, client := range room.Clients {
		if id != excludeClient {
			select {
			case client.send <- msg:
			default:
				log.Printf("Failed to broadcast to client %s", id)
			}
		}
	}
}

func (h *Hub) GetRoomStats(roomID string) map[string]interface{} {
	h.mu.RLock()
	room, exists := h.rooms[roomID]
	h.mu.RUnlock()

	if !exists {
		return map[string]interface{}{
			"exists":     false,
			"client_count": 0,
		}
	}

	room.mu.RLock()
	defer room.mu.RUnlock()

	clientIDs := make([]string, 0, len(room.Clients))
	for id := range room.Clients {
		clientIDs = append(clientIDs, id)
	}

	return map[string]interface{}{
		"exists":       true,
		"client_count": len(room.Clients),
		"clients":      clientIDs,
	}
}
