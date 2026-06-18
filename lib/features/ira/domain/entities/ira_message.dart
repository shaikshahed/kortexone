import 'package:equatable/equatable.dart';

enum MessageSender { user, assistant }

class IraMessage extends Equatable {
  final String id;
  final String agentId;
  final MessageSender sender;
  final String text;
  final DateTime timestamp;
  final List<String>? suggestions;
  final String? modelUsed;
  final double? responseTimeMs;
  final String? intent;
  final String? dataSource;
  final String? chatId;

  const IraMessage({
    required this.id,
    required this.agentId,
    required this.sender,
    required this.text,
    required this.timestamp,
    this.suggestions,
    this.modelUsed,
    this.responseTimeMs,
    this.intent,
    this.dataSource,
    this.chatId,
  });

  @override
  List<Object?> get props => [
        id,
        agentId,
        sender,
        text,
        timestamp,
        suggestions,
        modelUsed,
        responseTimeMs,
        intent,
        dataSource,
        chatId,
      ];
}
