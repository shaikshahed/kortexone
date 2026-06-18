import 'package:equatable/equatable.dart';

enum MessageSender { user, assistant }

class IraMessage extends Equatable {
  final String id;
  final String agentId;
  final MessageSender sender;
  final String text;
  final DateTime timestamp;

  const IraMessage({
    required this.id,
    required this.agentId,
    required this.sender,
    required this.text,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, agentId, sender, text, timestamp];
}
