import React, { useEffect, useRef, useState } from 'react';
import { useParams, useSearchParams, useNavigate } from 'react-router-dom';
import socketService from '../services/socket';
import webrtcService from '../services/webrtc';
import VideoGrid from '../components/VideoGrid';
import Controls from '../components/Controls';
import Chat from '../components/Chat';
import './Room.css';

interface Participant {
  id: string;
  name: string;
  stream?: MediaStream;
  isVideoEnabled: boolean;
  isAudioEnabled: boolean;
}

interface ChatMessage {
  message: string;
  userName: string;
  userId: string;
  timestamp: string;
}

const Room: React.FC = () => {
  const { roomId } = useParams<{ roomId: string }>();
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const userName = searchParams.get('name') || 'Anonymous';

  const [participants, setParticipants] = useState<Map<string, Participant>>(new Map());
  const [localStream, setLocalStream] = useState<MediaStream | null>(null);
  const [isVideoEnabled, setIsVideoEnabled] = useState(true);
  const [isAudioEnabled, setIsAudioEnabled] = useState(true);
  const [isChatOpen, setIsChatOpen] = useState(false);
  const [chatMessages, setChatMessages] = useState<ChatMessage[]>([]);
  const [screenStream, setScreenStream] = useState<MediaStream | null>(null);
  const [isScreenSharing, setIsScreenSharing] = useState(false);

  const localStreamRef = useRef<MediaStream | null>(null);
  const hasJoinedRef = useRef(false);

  useEffect(() => {
    if (!roomId || hasJoinedRef.current) return;

    const init = async () => {
      try {
        // Get user media
        const stream = await webrtcService.getUserMedia({
          video: true,
          audio: true,
        });

        setLocalStream(stream);
        localStreamRef.current = stream;

        // Connect to socket
        const socket = socketService.connect();

        // Join room
        socket.emit('join-room', { roomId, userName });
        hasJoinedRef.current = true;

        // Handle existing users
        socket.on('room-users', async (users: any[]) => {
          console.log('Existing users:', users);
          for (const user of users) {
            await createPeerConnection(user.id, user.name, true);
          }
        });

        // Handle new user joined
        socket.on('user-joined', async ({ userId, userName }: any) => {
          console.log('User joined:', userName);
          await createPeerConnection(userId, userName, false);
        });

        // Handle offer
        socket.on('offer', async ({ offer, from }: any) => {
          console.log('Received offer from:', from);
          const peerConnection = webrtcService.getPeerConnection(from);

          if (!peerConnection) {
            console.error('No peer connection found for:', from);
            return;
          }

          await webrtcService.setRemoteDescription(from, offer);
          const answer = await webrtcService.createAnswer(from);

          if (answer) {
            socket.emit('answer', { answer, to: from });
          }
        });

        // Handle answer
        socket.on('answer', async ({ answer, from }: any) => {
          console.log('Received answer from:', from);
          await webrtcService.setRemoteDescription(from, answer);
        });

        // Handle ICE candidate
        socket.on('ice-candidate', async ({ candidate, from }: any) => {
          await webrtcService.addIceCandidate(from, candidate);
        });

        // Handle user left
        socket.on('user-left', ({ userId, userName }: any) => {
          console.log('User left:', userName);
          webrtcService.closePeerConnection(userId);
          setParticipants((prev) => {
            const newMap = new Map(prev);
            newMap.delete(userId);
            return newMap;
          });
        });

        // Handle video toggle
        socket.on('user-video-toggle', ({ userId, enabled }: any) => {
          setParticipants((prev) => {
            const newMap = new Map(prev);
            const participant = newMap.get(userId);
            if (participant) {
              participant.isVideoEnabled = enabled;
              newMap.set(userId, participant);
            }
            return newMap;
          });
        });

        // Handle audio toggle
        socket.on('user-audio-toggle', ({ userId, enabled }: any) => {
          setParticipants((prev) => {
            const newMap = new Map(prev);
            const participant = newMap.get(userId);
            if (participant) {
              participant.isAudioEnabled = enabled;
              newMap.set(userId, participant);
            }
            return newMap;
          });
        });

        // Handle chat messages
        socket.on('chat-message', (msg: ChatMessage) => {
          setChatMessages((prev) => [...prev, msg]);
        });

      } catch (error) {
        console.error('Error initializing room:', error);
        alert('Failed to access camera/microphone');
        navigate('/');
      }
    };

    init();

    return () => {
      // Cleanup
      if (localStreamRef.current) {
        localStreamRef.current.getTracks().forEach((track) => track.stop());
      }
      if (screenStream) {
        screenStream.getTracks().forEach((track) => track.stop());
      }
      webrtcService.closeAllConnections();
      socketService.disconnect();
    };
  }, [roomId, userName, navigate]);

  const createPeerConnection = async (
    peerId: string,
    peerName: string,
    isInitiator: boolean
  ) => {
    const socket = socketService.getSocket();
    if (!socket) return;

    const peerConnection = webrtcService.createPeerConnection(
      peerId,
      (stream: MediaStream) => {
        console.log('Received stream from:', peerName);
        setParticipants((prev) => {
          const newMap = new Map(prev);
          const existing = newMap.get(peerId);
          newMap.set(peerId, {
            id: peerId,
            name: peerName,
            stream,
            isVideoEnabled: existing?.isVideoEnabled ?? true,
            isAudioEnabled: existing?.isAudioEnabled ?? true,
          });
          return newMap;
        });
      },
      (candidate: RTCIceCandidate) => {
        socket.emit('ice-candidate', { candidate, to: peerId });
      }
    );

    // Add local stream tracks
    if (localStreamRef.current) {
      localStreamRef.current.getTracks().forEach((track) => {
        if (localStreamRef.current) {
          webrtcService.addTrack(peerId, track, localStreamRef.current);
        }
      });
    }

    // Create participant entry
    setParticipants((prev) => {
      const newMap = new Map(prev);
      newMap.set(peerId, {
        id: peerId,
        name: peerName,
        isVideoEnabled: true,
        isAudioEnabled: true,
      });
      return newMap;
    });

    // If initiator, create and send offer
    if (isInitiator) {
      const offer = await webrtcService.createOffer(peerId);
      if (offer) {
        socket.emit('offer', { offer, to: peerId });
      }
    }
  };

  const toggleVideo = () => {
    if (localStream) {
      const videoTrack = localStream.getVideoTracks()[0];
      if (videoTrack) {
        videoTrack.enabled = !videoTrack.enabled;
        setIsVideoEnabled(videoTrack.enabled);
        socketService.emit('toggle-video', { roomId, enabled: videoTrack.enabled });
      }
    }
  };

  const toggleAudio = () => {
    if (localStream) {
      const audioTrack = localStream.getAudioTracks()[0];
      if (audioTrack) {
        audioTrack.enabled = !audioTrack.enabled;
        setIsAudioEnabled(audioTrack.enabled);
        socketService.emit('toggle-audio', { roomId, enabled: audioTrack.enabled });
      }
    }
  };

  const toggleScreenShare = async () => {
    if (isScreenSharing) {
      // Stop screen sharing
      if (screenStream) {
        screenStream.getTracks().forEach((track) => track.stop());
        setScreenStream(null);
      }
      setIsScreenSharing(false);
      socketService.emit('stop-screen-share', { roomId });
    } else {
      // Start screen sharing
      try {
        const stream = await webrtcService.getDisplayMedia();
        setScreenStream(stream);
        setIsScreenSharing(true);
        socketService.emit('start-screen-share', { roomId });

        // Handle screen share stop
        stream.getVideoTracks()[0].onended = () => {
          setScreenStream(null);
          setIsScreenSharing(false);
          socketService.emit('stop-screen-share', { roomId });
        };
      } catch (error) {
        console.error('Error sharing screen:', error);
      }
    }
  };

  const sendMessage = (message: string) => {
    socketService.emit('chat-message', { message, roomId });
  };

  const leaveRoom = () => {
    navigate('/');
  };

  const copyRoomId = () => {
    if (roomId) {
      navigator.clipboard.writeText(roomId);
      alert('Room ID copied to clipboard!');
    }
  };

  return (
    <div className="room-container">
      <div className="room-header">
        <h2>Meeting Room</h2>
        <div className="room-info">
          <span>Room ID: {roomId}</span>
          <button onClick={copyRoomId} className="copy-btn">
            Copy
          </button>
        </div>
      </div>

      <div className="room-content">
        <div className="video-section">
          <VideoGrid
            localStream={screenStream || localStream}
            participants={Array.from(participants.values())}
            isLocalVideoEnabled={isVideoEnabled}
            localUserName={userName}
          />
        </div>

        {isChatOpen && (
          <Chat
            messages={chatMessages}
            onSendMessage={sendMessage}
            onClose={() => setIsChatOpen(false)}
          />
        )}
      </div>

      <Controls
        isVideoEnabled={isVideoEnabled}
        isAudioEnabled={isAudioEnabled}
        isScreenSharing={isScreenSharing}
        onToggleVideo={toggleVideo}
        onToggleAudio={toggleAudio}
        onToggleScreenShare={toggleScreenShare}
        onToggleChat={() => setIsChatOpen(!isChatOpen)}
        onLeaveRoom={leaveRoom}
      />
    </div>
  );
};

export default Room;
