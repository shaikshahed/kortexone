import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/ira_message.dart';

part 'ira_message_model.freezed.dart';
part 'ira_message_model.g.dart';

@freezed
abstract class IraMessageModel with _$IraMessageModel {
  const factory IraMessageModel({
    required String id,
    required String agentId,
    required String sender,
    required String text,
    required String timestamp,
  }) = _IraMessageModel;

  factory IraMessageModel.fromJson(Map<String, dynamic> json) =>
      _$IraMessageModelFromJson(json);

  const IraMessageModel._();

  IraMessage toEntity() => IraMessage(
        id: id,
        agentId: agentId,
        sender: sender == 'user' ? MessageSender.user : MessageSender.assistant,
        text: text,
        timestamp: DateTime.tryParse(timestamp) ?? DateTime.now(),
      );
}
