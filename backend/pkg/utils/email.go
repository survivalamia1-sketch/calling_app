package utils

import (
	"bytes"
	"fmt"
	"html/template"

	"github.com/yourusername/calling-app-backend/pkg/config"
	"gopkg.in/gomail.v2"
)

type EmailService struct {
	config *config.Config
}

func NewEmailService(cfg *config.Config) *EmailService {
	return &EmailService{config: cfg}
}

// SendEmail sends an email
func (s *EmailService) SendEmail(to, subject, body string) error {
	m := gomail.NewMessage()
	m.SetHeader("From", fmt.Sprintf("%s <%s>", s.config.SMTP.FromName, s.config.SMTP.From))
	m.SetHeader("To", to)
	m.SetHeader("Subject", subject)
	m.SetBody("text/html", body)

	d := gomail.NewDialer(
		s.config.SMTP.Host,
		s.config.SMTP.Port,
		s.config.SMTP.Username,
		s.config.SMTP.Password,
	)

	if err := d.DialAndSend(m); err != nil {
		return fmt.Errorf("failed to send email: %w", err)
	}

	return nil
}

// SendVerificationEmail sends email verification link
func (s *EmailService) SendVerificationEmail(to, token string) error {
	verificationLink := fmt.Sprintf("%s/verify-email?token=%s", s.config.SMTP.From, token)

	tmpl := `
<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .button {
            display: inline-block;
            padding: 12px 24px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 20px 0;
        }
        .footer { margin-top: 30px; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to Calling App!</h2>
        <p>Thank you for signing up. Please verify your email address by clicking the button below:</p>
        <a href="{{.Link}}" class="button">Verify Email</a>
        <p>Or copy and paste this link into your browser:</p>
        <p>{{.Link}}</p>
        <p>This link will expire in 24 hours.</p>
        <div class="footer">
            <p>If you didn't create an account, please ignore this email.</p>
        </div>
    </div>
</body>
</html>
	`

	t, err := template.New("verification").Parse(tmpl)
	if err != nil {
		return err
	}

	var body bytes.Buffer
	data := struct {
		Link string
	}{
		Link: verificationLink,
	}

	if err := t.Execute(&body, data); err != nil {
		return err
	}

	return s.SendEmail(to, "Verify Your Email", body.String())
}

// SendPasswordResetEmail sends password reset link
func (s *EmailService) SendPasswordResetEmail(to, token string) error {
	resetLink := fmt.Sprintf("%s/reset-password?token=%s", s.config.SMTP.From, token)

	tmpl := `
<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .button {
            display: inline-block;
            padding: 12px 24px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 20px 0;
        }
        .footer { margin-top: 30px; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Password Reset Request</h2>
        <p>We received a request to reset your password. Click the button below to reset it:</p>
        <a href="{{.Link}}" class="button">Reset Password</a>
        <p>Or copy and paste this link into your browser:</p>
        <p>{{.Link}}</p>
        <p>This link will expire in 1 hour.</p>
        <div class="footer">
            <p>If you didn't request a password reset, please ignore this email.</p>
        </div>
    </div>
</body>
</html>
	`

	t, err := template.New("reset").Parse(tmpl)
	if err != nil {
		return err
	}

	var body bytes.Buffer
	data := struct {
		Link string
	}{
		Link: resetLink,
	}

	if err := t.Execute(&body, data); err != nil {
		return err
	}

	return s.SendEmail(to, "Reset Your Password", body.String())
}
