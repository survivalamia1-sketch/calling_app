package models

import (
	"time"

	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type AdminRole string

const (
	AdminRoleAdmin      AdminRole = "admin"
	AdminRoleSuperAdmin AdminRole = "super_admin"
)

type Admin struct {
	ID           uuid.UUID `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	Email        string    `gorm:"uniqueIndex;not null" json:"email"`
	Password     string    `gorm:"not null" json:"-"`
	FirstName    string    `gorm:"size:100" json:"first_name"`
	LastName     string    `gorm:"size:100" json:"last_name"`
	Role         AdminRole `gorm:"type:varchar(50);default:'admin'" json:"role"`
	IsActive     bool      `gorm:"default:true" json:"is_active"`
	LastLoginAt  *time.Time `json:"last_login_at"`
	CreatedAt    time.Time  `json:"created_at"`
	UpdatedAt    time.Time  `json:"updated_at"`
	DeletedAt    gorm.DeletedAt `gorm:"index" json:"-"`
}

// BeforeCreate hook
func (a *Admin) BeforeCreate(tx *gorm.DB) error {
	if a.ID == uuid.Nil {
		a.ID = uuid.New()
	}
	return nil
}

// HashPassword hashes the admin password
func (a *Admin) HashPassword(password string) error {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return err
	}
	a.Password = string(hashedPassword)
	return nil
}

// CheckPassword compares the given password with the hashed password
func (a *Admin) CheckPassword(password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(a.Password), []byte(password))
	return err == nil
}

// GetFullName returns the full name of the admin
func (a *Admin) GetFullName() string {
	if a.FirstName == "" && a.LastName == "" {
		return a.Email
	}
	return a.FirstName + " " + a.LastName
}

// IsSuperAdmin checks if admin is super admin
func (a *Admin) IsSuperAdmin() bool {
	return a.Role == AdminRoleSuperAdmin
}

// PublicAdmin returns admin data without sensitive fields
type PublicAdmin struct {
	ID          uuid.UUID  `json:"id"`
	Email       string     `json:"email"`
	FirstName   string     `json:"first_name"`
	LastName    string     `json:"last_name"`
	Role        AdminRole  `json:"role"`
	IsActive    bool       `json:"is_active"`
	LastLoginAt *time.Time `json:"last_login_at"`
	CreatedAt   time.Time  `json:"created_at"`
}

func (a *Admin) ToPublic() PublicAdmin {
	return PublicAdmin{
		ID:          a.ID,
		Email:       a.Email,
		FirstName:   a.FirstName,
		LastName:    a.LastName,
		Role:        a.Role,
		IsActive:    a.IsActive,
		LastLoginAt: a.LastLoginAt,
		CreatedAt:   a.CreatedAt,
	}
}

// AuditLog tracks admin actions for security
type AuditLog struct {
	ID          uuid.UUID `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	AdminID     uuid.UUID `gorm:"type:uuid;not null;index" json:"admin_id"`
	Action      string    `gorm:"size:100;not null" json:"action"`
	EntityType  string    `gorm:"size:50" json:"entity_type"`
	EntityID    string    `json:"entity_id"`
	Details     string    `gorm:"type:text" json:"details"`
	IPAddress   string    `gorm:"size:45" json:"ip_address"`
	UserAgent   string    `json:"user_agent"`
	CreatedAt   time.Time `json:"created_at"`

	// Relationships
	Admin *Admin `gorm:"foreignKey:AdminID" json:"admin,omitempty"`
}
