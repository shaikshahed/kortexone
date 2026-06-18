import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/ira_message.dart';

part 'ira_messages_response_model.freezed.dart';
part 'ira_messages_response_model.g.dart';

@freezed
abstract class IraMessageItemModel with _$IraMessageItemModel {
  const factory IraMessageItemModel({
    required String id,
    required String role,
    required String content,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _IraMessageItemModel;

  factory IraMessageItemModel.fromJson(Map<String, dynamic> json) =>
      _$IraMessageItemModelFromJson(json);

  const IraMessageItemModel._();

  IraMessage toEntity({required String agentId}) {
    return IraMessage(
      id: id,
      agentId: agentId,
      sender: role == 'user' ? MessageSender.user : MessageSender.assistant,
      text: content,
      timestamp: DateTime.tryParse(createdAt) ?? DateTime.now(),
    );
  }
}

@freezed
abstract class IraMessagesResponseModel with _$IraMessagesResponseModel {
  const factory IraMessagesResponseModel({
    required List<IraMessageItemModel> messages,
  }) = _IraMessagesResponseModel;

  factory IraMessagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IraMessagesResponseModelFromJson(json);
}
