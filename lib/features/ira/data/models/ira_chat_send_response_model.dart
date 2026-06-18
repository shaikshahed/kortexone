import 'package:freezed_annotation/freezed_annotation.dart';

part 'ira_chat_send_response_model.freezed.dart';
part 'ira_chat_send_response_model.g.dart';

@freezed
abstract class IraChatSendResponseModel with _$IraChatSendResponseModel {
  const factory IraChatSendResponseModel({
    String? answer,
    String? response,
    @JsonKey(name: 'suggested_questions') List<String>? suggestedQuestions,
    List<dynamic>? sources,
    @JsonKey(name: 'chat_id') String? chatId,
    @JsonKey(name: 'session_id') String? sessionId,
    @JsonKey(name: 'message_id') String? messageId,
    @JsonKey(name: 'model_used') String? modelUsed,
    @JsonKey(name: 'provider_name') String? providerName,
    @JsonKey(name: 'response_time_ms') double? responseTimeMs,
    @JsonKey(name: 'total_time_ms') double? totalTimeMs,
    String? intent,
    @JsonKey(name: 'data_source') String? dataSource,
    @JsonKey(name: 'cached_at') String? cachedAt,
    @JsonKey(name: '__metadata__') bool? metadata,
  }) = _IraChatSendResponseModel;

  factory IraChatSendResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IraChatSendResponseModelFromJson(json);
}
