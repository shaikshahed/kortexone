import 'package:equatable/equatable.dart';

class IraConversation extends Equatable {
  final String id;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String assistantId;

  const IraConversation({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.assistantId,
  });

  IraConversation copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? assistantId,
  }) {
    return IraConversation(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      assistantId: assistantId ?? this.assistantId,
    );
  }

  @override
  List<Object?> get props => [id, title, createdAt, updatedAt, assistantId];
}
