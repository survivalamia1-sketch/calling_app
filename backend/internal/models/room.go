package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type RoomStatus string

const (
	RoomStatusWaiting    RoomStatus = "waiting"
	RoomStatusActive     RoomStatus = "active"
	RoomStatusEnded      RoomStatus = "ended"
	RoomStatusScheduled  RoomStatus = "scheduled"
)

type Room struct {
	ID               uuid.UUID  `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	HostID           uuid.UUID  `gorm:"type:uuid;not null;index" json:"host_id"`
	Name             string     `gorm:"size:255" json:"name"`
	Description      string     `json:"description"`
	Status           RoomStatus `gorm:"default:'waiting'" json:"status"`
	Password         string     `json:"password,omitempty"`
	IsPasswordLocked bool       `gorm:"default:false" json:"is_password_locked"`
	HasWaitingRoom   bool       `gorm:"default:false" json:"has_waiting_room"`
	MaxParticipants  int        `gorm:"default:10" json:"max_participants"`
	IsRecording      bool       `gorm:"default:false" json:"is_recording"`
	RecordingURL     string     `json:"recording_url,omitempty"`
	ScheduledAt      *time.Time `json:"scheduled_at,omitempty"`
	StartedAt        *time.Time `json:"started_at,omitempty"`
	EndedAt          *time.Time `json:"ended_at,omitempty"`
	Duration         int        `json:"duration"` // in seconds
	CreatedAt        time.Time  `json:"created_at"`
	UpdatedAt        time.Time  `json:"updated_at"`
	DeletedAt        gorm.DeletedAt `gorm:"index" json:"-"`

	// Relationships
	Host         *User              `gorm:"foreignKey:HostID" json:"host,omitempty"`
	Participants []RoomParticipant  `gorm:"foreignKey:RoomID" json:"participants,omitempty"`
}

type RoomParticipant struct {
	ID         uuid.UUID  `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	RoomID     uuid.UUID  `gorm:"type:uuid;not null;index" json:"room_id"`
	UserID     uuid.UUID  `gorm:"type:uuid;index" json:"user_id,omitempty"`
	Name       string     `gorm:"size:255" json:"name"` // For guest users
	SocketID   string     `json:"socket_id"`
	IsGuest    bool       `gorm:"default:false" json:"is_guest"`
	IsHost     bool       `gorm:"default:false" json:"is_host"`
	IsMuted    bool       `gorm:"default:false" json:"is_muted"`
	IsVideoOff bool       `gorm:"default:false" json:"is_video_off"`
	JoinedAt   time.Time  `json:"joined_at"`
	LeftAt     *time.Time `json:"left_at,omitempty"`
	CreatedAt  time.Time  `json:"created_at"`
	UpdatedAt  time.Time  `json:"updated_at"`

	// Relationships
	Room *Room `gorm:"foreignKey:RoomID" json:"room,omitempty"`
	User *User `gorm:"foreignKey:UserID" json:"user,omitempty"`
}

// IsActive checks if room is currently active
func (r *Room) IsActive() bool {
	return r.Status == RoomStatusActive
}

// CanJoin checks if a user can join the room
func (r *Room) CanJoin(participantCount int) bool {
	if r.Status == RoomStatusEnded {
		return false
	}
	if r.MaxParticipants > 0 && participantCount >= r.MaxParticipants {
		return false
	}
	return true
}

// Start marks the room as started
func (r *Room) Start() {
	now := time.Now()
	r.Status = RoomStatusActive
	r.StartedAt = &now
}

// End marks the room as ended
func (r *Room) End() {
	now := time.Now()
	r.Status = RoomStatusEnded
	r.EndedAt = &now
	if r.StartedAt != nil {
		r.Duration = int(now.Sub(*r.StartedAt).Seconds())
	}
}

// GetActiveParticipantCount returns count of active participants
func (r *Room) GetActiveParticipantCount() int {
	count := 0
	for _, p := range r.Participants {
		if p.LeftAt == nil {
			count++
		}
	}
	return count
}
