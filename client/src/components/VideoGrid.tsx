import React, { useEffect, useRef } from 'react';
import './VideoGrid.css';

interface Participant {
  id: string;
  name: string;
  stream?: MediaStream;
  isVideoEnabled: boolean;
  isAudioEnabled: boolean;
}

interface VideoGridProps {
  localStream: MediaStream | null;
  participants: Participant[];
  isLocalVideoEnabled: boolean;
  localUserName: string;
}

const VideoGrid: React.FC<VideoGridProps> = ({
  localStream,
  participants,
  isLocalVideoEnabled,
  localUserName,
}) => {
  return (
    <div className={`video-grid grid-${Math.min(participants.length + 1, 4)}`}>
      {/* Local video */}
      <VideoTile
        stream={localStream}
        name={`${localUserName} (You)`}
        isVideoEnabled={isLocalVideoEnabled}
        isLocal={true}
      />

      {/* Remote videos */}
      {participants.map((participant) => (
        <VideoTile
          key={participant.id}
          stream={participant.stream}
          name={participant.name}
          isVideoEnabled={participant.isVideoEnabled}
          isMuted={!participant.isAudioEnabled}
          isLocal={false}
        />
      ))}
    </div>
  );
};

interface VideoTileProps {
  stream?: MediaStream | null;
  name: string;
  isVideoEnabled: boolean;
  isLocal?: boolean;
  isMuted?: boolean;
}

const VideoTile: React.FC<VideoTileProps> = ({
  stream,
  name,
  isVideoEnabled,
  isLocal = false,
  isMuted = false,
}) => {
  const videoRef = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    if (videoRef.current && stream) {
      videoRef.current.srcObject = stream;
    }
  }, [stream]);

  return (
    <div className="video-tile">
      <video
        ref={videoRef}
        autoPlay
        playsInline
        muted={isLocal}
        className={`video ${!isVideoEnabled ? 'hidden' : ''}`}
      />

      {!isVideoEnabled && (
        <div className="video-placeholder">
          <div className="avatar">
            {name.charAt(0).toUpperCase()}
          </div>
        </div>
      )}

      <div className="video-info">
        <span className="participant-name">{name}</span>
        {isMuted && <span className="muted-icon">🔇</span>}
      </div>
    </div>
  );
};

export default VideoGrid;
