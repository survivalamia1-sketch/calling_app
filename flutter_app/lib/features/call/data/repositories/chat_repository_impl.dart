import 'dart:async';

import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../services/signaling_service.dart';

/// Real implementation of ChatRepository using SignalingService
class ChatRepositoryImpl implements ChatRepository {
  final SignalingService _signalingService;

  final StreamController<List<ChatMessage>> _messagesController =
      StreamController<List<ChatMessage>>.broadcast();
  final StreamController<int> _unreadCountController =
      StreamController<int>.broadcast();

  final List<ChatMessage> _messages = [];
  int _unreadCount = 0;
  String? _currentUserId;
  String? _currentRoomId;
  StreamSubscription? _messageSubscription;

  ChatRepositoryImpl({required SignalingService signalingService})
      : _signalingService = signalingService;

  /// Initialize chat connection for a specific room
  @override
  Future<void> initialize({
    required String roomId,
    required String userId,
  }) async {
    _currentRoomId = roomId;
    _currentUserId = userId;

    // Listen to incoming chat messages from signaling service
    _messageSubscription = _signalingService.messages.listen(
      (signalingMessage) {
        // Filter for chat-related messages
        if (signalingMessage.type == 'chat' ||
            signalingMessage.type == 'message' ||
            signalingMessage.type == 'private_message') {
          try {
            final message = _parseMessage(signalingMessage.data ?? {});

            _messages.add(message);
            _messagesController.add(List.from(_messages));

            // Increment unread count if message is not from current user
            if (message.senderId != _currentUserId) {
              _unreadCount++;
              _unreadCountController.add(_unreadCount);
            }
          } catch (e) {
            // Error parsing message
          }
        }
      },
    );

    // Emit initial empty state
    _messagesController.add(_messages);
    _unreadCountController.add(_unreadCount);
  }

  @override
  Stream<List<ChatMessage>> watchMessages() {
    return _messagesController.stream;
  }

  @override
  Future<void> sendMessage(String content) async {
    if (_currentRoomId == null || _currentUserId == null) {
      throw Exception('Chat not initialized');
    }

    _signalingService.send(SignalingMessage(
      type: 'chat',
      roomId: _currentRoomId,
      userId: _currentUserId,
      data: {
        'content': content,
        'timestamp': DateTime.now().toIso8601String(),
        'is_private': false,
      },
    ));
  }

  @override
  Future<void> sendPrivateMessage(String content, String recipientId) async {
    if (_currentRoomId == null || _currentUserId == null) {
      throw Exception('Chat not initialized');
    }

    _signalingService.send(SignalingMessage(
      type: 'private_message',
      roomId: _currentRoomId,
      userId: _currentUserId,
      data: {
        'content': content,
        'recipient_id': recipientId,
        'timestamp': DateTime.now().toIso8601String(),
        'is_private': true,
      },
    ));
  }

  @override
  Future<List<ChatMessage>> getChatHistory() async {
    // In a real implementation, this would fetch from backend
    // For now, return the current messages
    return List.from(_messages);
  }

  @override
  Future<void> deleteMessage(String messageId) async {
    _messages.removeWhere((msg) => msg.id == messageId);
    _messagesController.add(List.from(_messages));
  }

  @override
  Stream<int> watchUnreadCount() {
    return _unreadCountController.stream;
  }

  @override
  Future<void> markAllAsRead() async {
    _unreadCount = 0;
    _unreadCountController.add(_unreadCount);
  }

  /// Parse message from JSON
  ChatMessage _parseMessage(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id']?.toString() ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: json['sender_id'] ?? json['user_id'] ?? '',
      senderName: json['sender_name'] ?? 'Unknown',
      content: json['content'] ?? '',
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
      isPrivate: json['is_private'] ?? false,
      recipientId: json['recipient_id'],
      recipientName: json['recipient_name'],
    );
  }

  /// Dispose and cleanup
  Future<void> dispose() async {
    await _messageSubscription?.cancel();
    await _messagesController.close();
    await _unreadCountController.close();
  }
}
