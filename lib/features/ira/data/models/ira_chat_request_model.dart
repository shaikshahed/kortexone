import 'package:freezed_annotation/freezed_annotation.dart';

part 'ira_chat_request_model.freezed.dart';
part 'ira_chat_request_model.g.dart';

@freezed
abstract class IraChatRequestModel with _$IraChatRequestModel {
  const factory IraChatRequestModel({
    required String message,
    @JsonKey(name: 'user_email') required String userEmail,
    @Default('gemini-2.5-flash') String model,
    @Default(true) bool stream,
    @JsonKey(name: 'frappe_state') String? frappeState,
    @JsonKey(name: 'agent_type') @Default('zoho') String agentType,
    @JsonKey(name: 'assistant_id') required String assistantId,
    @JsonKey(name: 'chat_id') String? chatId,
  }) = _IraChatRequestModel;

  factory IraChatRequestModel.fromJson(Map<String, dynamic> json) =>
      _$IraChatRequestModelFromJson(json);
}
