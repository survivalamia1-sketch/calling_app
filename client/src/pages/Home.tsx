import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import './Home.css';

const SERVER_URL = process.env.REACT_APP_SERVER_URL || 'http://localhost:5000';

const Home: React.FC = () => {
  const [userName, setUserName] = useState('');
  const [roomId, setRoomId] = useState('');
  const [isCreating, setIsCreating] = useState(false);
  const navigate = useNavigate();

  const createRoom = async () => {
    if (!userName.trim()) {
      alert('Please enter your name');
      return;
    }

    setIsCreating(true);
    try {
      const response = await fetch(`${SERVER_URL}/api/room/create`, {
        method: 'POST',
      });
      const data = await response.json();
      navigate(`/room/${data.roomId}?name=${encodeURIComponent(userName)}`);
    } catch (error) {
      console.error('Error creating room:', error);
      alert('Failed to create room');
    } finally {
      setIsCreating(false);
    }
  };

  const joinRoom = () => {
    if (!userName.trim()) {
      alert('Please enter your name');
      return;
    }
    if (!roomId.trim()) {
      alert('Please enter a room ID');
      return;
    }

    navigate(`/room/${roomId}?name=${encodeURIComponent(userName)}`);
  };

  return (
    <div className="home-container">
      <div className="home-content">
        <div className="logo">
          <svg width="60" height="60" viewBox="0 0 60 60" fill="none">
            <rect width="60" height="60" rx="12" fill="#4F46E5" />
            <path
              d="M20 25C20 23.3431 21.3431 22 23 22H37C38.6569 22 40 23.3431 40 25V35C40 36.6569 38.6569 38 37 38H23C21.3431 38 20 36.6569 20 35V25Z"
              fill="white"
            />
            <circle cx="43" cy="27" r="3" fill="white" />
            <circle cx="43" cy="33" r="3" fill="white" />
          </svg>
        </div>
        <h1>Video Calling App</h1>
        <p className="subtitle">Connect with anyone, anywhere</p>

        <div className="input-section">
          <input
            type="text"
            placeholder="Enter your name"
            value={userName}
            onChange={(e) => setUserName(e.target.value)}
            className="input-field"
            onKeyPress={(e) => e.key === 'Enter' && createRoom()}
          />

          <button
            onClick={createRoom}
            disabled={isCreating}
            className="btn btn-primary"
          >
            {isCreating ? 'Creating...' : 'Create New Meeting'}
          </button>

          <div className="divider">
            <span>OR</span>
          </div>

          <input
            type="text"
            placeholder="Enter room ID"
            value={roomId}
            onChange={(e) => setRoomId(e.target.value)}
            className="input-field"
            onKeyPress={(e) => e.key === 'Enter' && joinRoom()}
          />

          <button onClick={joinRoom} className="btn btn-secondary">
            Join Meeting
          </button>
        </div>

        <div className="features">
          <div className="feature">
            <span className="feature-icon">🎥</span>
            <span>HD Video</span>
          </div>
          <div className="feature">
            <span className="feature-icon">🎤</span>
            <span>Crystal Audio</span>
          </div>
          <div className="feature">
            <span className="feature-icon">💬</span>
            <span>Live Chat</span>
          </div>
          <div className="feature">
            <span className="feature-icon">🖥️</span>
            <span>Screen Share</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home;
