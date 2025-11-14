import React, { useState, useRef, useEffect } from 'react';
import './Chat.css';

interface ChatMessage {
  message: string;
  userName: string;
  userId: string;
  timestamp: string;
}

interface ChatProps {
  messages: ChatMessage[];
  onSendMessage: (message: string) => void;
  onClose: () => void;
}

const Chat: React.FC<ChatProps> = ({ messages, onSendMessage, onClose }) => {
  const [inputMessage, setInputMessage] = useState('');
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (inputMessage.trim()) {
      onSendMessage(inputMessage);
      setInputMessage('');
    }
  };

  const formatTime = (timestamp: string) => {
    const date = new Date(timestamp);
    return date.toLocaleTimeString('en-US', {
      hour: '2-digit',
      minute: '2-digit',
    });
  };

  return (
    <div className="chat-container">
      <div className="chat-header">
        <h3>Chat</h3>
        <button className="close-btn" onClick={onClose}>
          ✕
        </button>
      </div>

      <div className="messages-container">
        {messages.length === 0 ? (
          <div className="no-messages">No messages yet. Start the conversation!</div>
        ) : (
          messages.map((msg, index) => (
            <div key={index} className="message">
              <div className="message-header">
                <span className="message-author">{msg.userName}</span>
                <span className="message-time">{formatTime(msg.timestamp)}</span>
              </div>
              <div className="message-content">{msg.message}</div>
            </div>
          ))
        )}
        <div ref={messagesEndRef} />
      </div>

      <form className="chat-input-container" onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Type a message..."
          value={inputMessage}
          onChange={(e) => setInputMessage(e.target.value)}
          className="chat-input"
        />
        <button type="submit" className="send-btn" disabled={!inputMessage.trim()}>
          Send
        </button>
      </form>
    </div>
  );
};

export default Chat;
