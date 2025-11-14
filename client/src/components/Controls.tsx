import React from 'react';
import './Controls.css';

interface ControlsProps {
  isVideoEnabled: boolean;
  isAudioEnabled: boolean;
  isScreenSharing: boolean;
  onToggleVideo: () => void;
  onToggleAudio: () => void;
  onToggleScreenShare: () => void;
  onToggleChat: () => void;
  onLeaveRoom: () => void;
}

const Controls: React.FC<ControlsProps> = ({
  isVideoEnabled,
  isAudioEnabled,
  isScreenSharing,
  onToggleVideo,
  onToggleAudio,
  onToggleScreenShare,
  onToggleChat,
  onLeaveRoom,
}) => {
  return (
    <div className="controls-container">
      <div className="controls">
        <button
          className={`control-btn ${!isAudioEnabled ? 'disabled' : ''}`}
          onClick={onToggleAudio}
          title={isAudioEnabled ? 'Mute' : 'Unmute'}
        >
          <span className="icon">{isAudioEnabled ? '🎤' : '🔇'}</span>
          <span className="label">{isAudioEnabled ? 'Mute' : 'Unmute'}</span>
        </button>

        <button
          className={`control-btn ${!isVideoEnabled ? 'disabled' : ''}`}
          onClick={onToggleVideo}
          title={isVideoEnabled ? 'Stop Video' : 'Start Video'}
        >
          <span className="icon">{isVideoEnabled ? '📹' : '🚫'}</span>
          <span className="label">{isVideoEnabled ? 'Stop Video' : 'Start Video'}</span>
        </button>

        <button
          className={`control-btn ${isScreenSharing ? 'active' : ''}`}
          onClick={onToggleScreenShare}
          title={isScreenSharing ? 'Stop Sharing' : 'Share Screen'}
        >
          <span className="icon">🖥️</span>
          <span className="label">{isScreenSharing ? 'Stop Share' : 'Share'}</span>
        </button>

        <button
          className="control-btn"
          onClick={onToggleChat}
          title="Toggle Chat"
        >
          <span className="icon">💬</span>
          <span className="label">Chat</span>
        </button>

        <button
          className="control-btn leave-btn"
          onClick={onLeaveRoom}
          title="Leave Meeting"
        >
          <span className="icon">📞</span>
          <span className="label">Leave</span>
        </button>
      </div>
    </div>
  );
};

export default Controls;
