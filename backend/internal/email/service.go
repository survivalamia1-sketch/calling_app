package email

import (
	"bytes"
	"fmt"
	"html/template"
	"net/smtp"
	"os"
)

type Service struct {
	from     string
	password string
	smtpHost string
	smtpPort string
	appURL   string
}

func NewService() *Service {
	return &Service{
		from:     getEnv("SMTP_FROM", "noreply@videocall.com"),
		password: getEnv("SMTP_PASSWORD", ""),
		smtpHost: getEnv("SMTP_HOST", "smtp.gmail.com"),
		smtpPort: getEnv("SMTP_PORT", "587"),
		appURL:   getEnv("APP_URL", "http://localhost:3000"),
	}
}

func getEnv(key, defaultValue string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return defaultValue
}

type EmailData struct {
	To              string
	Subject         string
	Name            string
	VerificationURL string
	ResetURL        string
	MeetingCode     string
	MeetingTime     string
	MeetingLink     string
}

func (s *Service) SendVerificationEmail(to, name, token string) error {
	data := EmailData{
		To:              to,
		Subject:         "Verify Your Email Address",
		Name:            name,
		VerificationURL: fmt.Sprintf("%s/auth/verify?token=%s", s.appURL, token),
	}

	body, err := s.renderTemplate("verification", data)
	if err != nil {
		return err
	}

	return s.sendEmail(to, data.Subject, body)
}

func (s *Service) SendPasswordResetEmail(to, name, token string) error {
	data := EmailData{
		To:       to,
		Subject:  "Reset Your Password",
		Name:     name,
		ResetURL: fmt.Sprintf("%s/auth/reset-password?token=%s", s.appURL, token),
	}

	body, err := s.renderTemplate("password_reset", data)
	if err != nil {
		return err
	}

	return s.sendEmail(to, data.Subject, body)
}

func (s *Service) SendMeetingInvitation(to, name, meetingCode, meetingTime string) error {
	data := EmailData{
		To:          to,
		Subject:     "Meeting Invitation",
		Name:        name,
		MeetingCode: meetingCode,
		MeetingTime: meetingTime,
		MeetingLink: fmt.Sprintf("%s/join/%s", s.appURL, meetingCode),
	}

	body, err := s.renderTemplate("meeting_invitation", data)
	if err != nil {
		return err
	}

	return s.sendEmail(to, data.Subject, body)
}

func (s *Service) renderTemplate(templateName string, data EmailData) (string, error) {
	templates := map[string]string{
		"verification": `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{.Subject}}</title>
</head>
<body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; padding: 20px;">
    <div style="background-color: #0284c7; padding: 20px; text-align: center;">
        <h1 style="color: white; margin: 0;">Video Call App</h1>
    </div>
    <div style="background-color: #f9f9f9; padding: 30px; border: 1px solid #ddd;">
        <h2>Welcome, {{.Name}}!</h2>
        <p>Thank you for signing up. Please verify your email address to activate your account.</p>
        <div style="text-align: center; margin: 30px 0;">
            <a href="{{.VerificationURL}}"
               style="background-color: #0284c7; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; display: inline-block;">
                Verify Email Address
            </a>
        </div>
        <p>Or copy and paste this link into your browser:</p>
        <p style="background-color: #eee; padding: 10px; word-break: break-all;">{{.VerificationURL}}</p>
        <p style="color: #666; font-size: 12px; margin-top: 30px;">
            This link will expire in 24 hours. If you didn't create an account, please ignore this email.
        </p>
    </div>
    <div style="text-align: center; padding: 20px; color: #666; font-size: 12px;">
        <p>&copy; 2024 Video Call App. All rights reserved.</p>
    </div>
</body>
</html>`,

		"password_reset": `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{.Subject}}</title>
</head>
<body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; padding: 20px;">
    <div style="background-color: #0284c7; padding: 20px; text-align: center;">
        <h1 style="color: white; margin: 0;">Video Call App</h1>
    </div>
    <div style="background-color: #f9f9f9; padding: 30px; border: 1px solid #ddd;">
        <h2>Password Reset Request</h2>
        <p>Hi {{.Name}},</p>
        <p>We received a request to reset your password. Click the button below to create a new password:</p>
        <div style="text-align: center; margin: 30px 0;">
            <a href="{{.ResetURL}}"
               style="background-color: #0284c7; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; display: inline-block;">
                Reset Password
            </a>
        </div>
        <p>Or copy and paste this link into your browser:</p>
        <p style="background-color: #eee; padding: 10px; word-break: break-all;">{{.ResetURL}}</p>
        <p style="color: #666; font-size: 12px; margin-top: 30px;">
            This link will expire in 1 hour. If you didn't request a password reset, please ignore this email.
        </p>
    </div>
    <div style="text-align: center; padding: 20px; color: #666; font-size: 12px;">
        <p>&copy; 2024 Video Call App. All rights reserved.</p>
    </div>
</body>
</html>`,

		"meeting_invitation": `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{.Subject}}</title>
</head>
<body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; padding: 20px;">
    <div style="background-color: #0284c7; padding: 20px; text-align: center;">
        <h1 style="color: white; margin: 0;">Video Call App</h1>
    </div>
    <div style="background-color: #f9f9f9; padding: 30px; border: 1px solid #ddd;">
        <h2>Meeting Invitation</h2>
        <p>Hi {{.Name}},</p>
        <p>You've been invited to a meeting!</p>
        <div style="background-color: white; padding: 20px; margin: 20px 0; border-left: 4px solid #0284c7;">
            <p><strong>Meeting Code:</strong> <span style="font-size: 24px; color: #0284c7; font-family: monospace;">{{.MeetingCode}}</span></p>
            <p><strong>Time:</strong> {{.MeetingTime}}</p>
        </div>
        <div style="text-align: center; margin: 30px 0;">
            <a href="{{.MeetingLink}}"
               style="background-color: #0284c7; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; display: inline-block;">
                Join Meeting
            </a>
        </div>
        <p>Or use the meeting code to join manually.</p>
    </div>
    <div style="text-align: center; padding: 20px; color: #666; font-size: 12px;">
        <p>&copy; 2024 Video Call App. All rights reserved.</p>
    </div>
</body>
</html>`,
	}

	tmpl, ok := templates[templateName]
	if !ok {
		return "", fmt.Errorf("template not found: %s", templateName)
	}

	t, err := template.New(templateName).Parse(tmpl)
	if err != nil {
		return "", err
	}

	var buf bytes.Buffer
	if err := t.Execute(&buf, data); err != nil {
		return "", err
	}

	return buf.String(), nil
}

func (s *Service) sendEmail(to, subject, body string) error {
	// Skip if no password configured (dev mode)
	if s.password == "" {
		fmt.Printf("EMAIL (dev mode): To=%s, Subject=%s\n", to, subject)
		return nil
	}

	auth := smtp.PlainAuth("", s.from, s.password, s.smtpHost)

	headers := fmt.Sprintf("From: %s\r\n"+
		"To: %s\r\n"+
		"Subject: %s\r\n"+
		"MIME-version: 1.0;\r\n"+
		"Content-Type: text/html; charset=\"UTF-8\";\r\n\r\n",
		s.from, to, subject)

	message := []byte(headers + body)

	addr := fmt.Sprintf("%s:%s", s.smtpHost, s.smtpPort)
	return smtp.SendMail(addr, auth, s.from, []string{to}, message)
}
