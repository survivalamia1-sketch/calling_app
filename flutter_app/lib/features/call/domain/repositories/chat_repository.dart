import '../entities/chat_message.dart';

/// Repository interface for chat functionality in the meeting
abstract class ChatRepository {
  /// Initialize chat connection for a specific room
  Future<void> initialize({
    required String roomId,
    required String userId,
  });

  /// Watch incoming messages stream
  Stream<List<ChatMessage>> watchMessages();

  /// Send a message to all participants
  Future<void> sendMessage(String content);

  /// Send a private message to a specific participant
  Future<void> sendPrivateMessage(String content, String recipientId);

  /// Get chat history
  Future<List<ChatMessage>> getChatHistory();

  /// Delete a message (sender or host only)
  Future<void> deleteMessage(String messageId);

  /// Get unread message count
  Stream<int> watchUnreadCount();

  /// Mark all messages as read
  Future<void> markAllAsRead();
}
