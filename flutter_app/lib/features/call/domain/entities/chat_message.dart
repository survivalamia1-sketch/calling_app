import 'package:equatable/equatable.dart';

/// Represents a chat message in the meeting
class ChatMessage extends Equatable {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime timestamp;
  final bool isPrivate;
  final String? recipientId;
  final String? recipientName;

  const ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    this.isPrivate = false,
    this.recipientId,
    this.recipientName,
  });

  @override
  List<Object?> get props => [
        id,
        senderId,
        senderName,
        content,
        timestamp,
        isPrivate,
        recipientId,
        recipientName,
      ];
}
