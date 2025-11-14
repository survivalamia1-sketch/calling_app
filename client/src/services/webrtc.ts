export interface PeerConnection {
  peerConnection: RTCPeerConnection;
  stream: MediaStream | null;
}

const ICE_SERVERS = {
  iceServers: [
    { urls: 'stun:stun.l.google.com:19302' },
    { urls: 'stun:stun1.l.google.com:19302' },
  ],
};

export class WebRTCService {
  private peerConnections: Map<string, PeerConnection> = new Map();

  createPeerConnection(
    peerId: string,
    onTrack: (stream: MediaStream) => void,
    onIceCandidate: (candidate: RTCIceCandidate) => void
  ): RTCPeerConnection {
    const peerConnection = new RTCPeerConnection(ICE_SERVERS);

    // Handle incoming tracks
    peerConnection.ontrack = (event) => {
      console.log('Received track from', peerId);
      if (event.streams && event.streams[0]) {
        onTrack(event.streams[0]);
      }
    };

    // Handle ICE candidates
    peerConnection.onicecandidate = (event) => {
      if (event.candidate) {
        onIceCandidate(event.candidate);
      }
    };

    // Handle connection state changes
    peerConnection.onconnectionstatechange = () => {
      console.log(`Connection state with ${peerId}:`, peerConnection.connectionState);
    };

    this.peerConnections.set(peerId, {
      peerConnection,
      stream: null,
    });

    return peerConnection;
  }

  getPeerConnection(peerId: string): PeerConnection | undefined {
    return this.peerConnections.get(peerId);
  }

  async createOffer(peerId: string): Promise<RTCSessionDescriptionInit | null> {
    const peer = this.peerConnections.get(peerId);
    if (!peer) return null;

    try {
      const offer = await peer.peerConnection.createOffer();
      await peer.peerConnection.setLocalDescription(offer);
      return offer;
    } catch (error) {
      console.error('Error creating offer:', error);
      return null;
    }
  }

  async createAnswer(peerId: string): Promise<RTCSessionDescriptionInit | null> {
    const peer = this.peerConnections.get(peerId);
    if (!peer) return null;

    try {
      const answer = await peer.peerConnection.createAnswer();
      await peer.peerConnection.setLocalDescription(answer);
      return answer;
    } catch (error) {
      console.error('Error creating answer:', error);
      return null;
    }
  }

  async setRemoteDescription(
    peerId: string,
    description: RTCSessionDescriptionInit
  ): Promise<void> {
    const peer = this.peerConnections.get(peerId);
    if (!peer) return;

    try {
      await peer.peerConnection.setRemoteDescription(
        new RTCSessionDescription(description)
      );
    } catch (error) {
      console.error('Error setting remote description:', error);
    }
  }

  async addIceCandidate(
    peerId: string,
    candidate: RTCIceCandidateInit
  ): Promise<void> {
    const peer = this.peerConnections.get(peerId);
    if (!peer) return;

    try {
      await peer.peerConnection.addIceCandidate(new RTCIceCandidate(candidate));
    } catch (error) {
      console.error('Error adding ICE candidate:', error);
    }
  }

  addTrack(peerId: string, track: MediaStreamTrack, stream: MediaStream): void {
    const peer = this.peerConnections.get(peerId);
    if (!peer) return;

    peer.peerConnection.addTrack(track, stream);
  }

  closePeerConnection(peerId: string): void {
    const peer = this.peerConnections.get(peerId);
    if (peer) {
      peer.peerConnection.close();
      this.peerConnections.delete(peerId);
    }
  }

  closeAllConnections(): void {
    this.peerConnections.forEach((peer, peerId) => {
      peer.peerConnection.close();
    });
    this.peerConnections.clear();
  }

  async getUserMedia(constraints: MediaStreamConstraints): Promise<MediaStream> {
    return await navigator.mediaDevices.getUserMedia(constraints);
  }

  async getDisplayMedia(): Promise<MediaStream> {
    return await navigator.mediaDevices.getDisplayMedia({
      video: true,
      audio: true
    });
  }
}

export default new WebRTCService();
