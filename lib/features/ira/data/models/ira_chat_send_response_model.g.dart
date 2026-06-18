// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ira_chat_send_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IraChatSendResponseModel _$IraChatSendResponseModelFromJson(
  Map<String, dynamic> json,
) => _IraChatSendResponseModel(
  answer: json['answer'] as String?,
  response: json['response'] as String?,
  suggestedQuestions: (json['suggested_questions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  sources: json['sources'] as List<dynamic>?,
  chatId: json['chat_id'] as String?,
  sessionId: json['session_id'] as String?,
  messageId: json['message_id'] as String?,
  modelUsed: json['model_used'] as String?,
  providerName: json['provider_name'] as String?,
  responseTimeMs: (json['response_time_ms'] as num?)?.toDouble(),
  totalTimeMs: (json['total_time_ms'] as num?)?.toDouble(),
  intent: json['intent'] as String?,
  dataSource: json['data_source'] as String?,
  cachedAt: json['cached_at'] as String?,
  metadata: json['__metadata__'] as bool?,
);

Map<String, dynamic> _$IraChatSendResponseModelToJson(
  _IraChatSendResponseModel instance,
) => <String, dynamic>{
  'answer': instance.answer,
  'response': instance.response,
  'suggested_questions': instance.suggestedQuestions,
  'sources': instance.sources,
  'chat_id': instance.chatId,
  'session_id': instance.sessionId,
  'message_id': instance.messageId,
  'model_used': instance.modelUsed,
  'provider_name': instance.providerName,
  'response_time_ms': instance.responseTimeMs,
  'total_time_ms': instance.totalTimeMs,
  'intent': instance.intent,
  'data_source': instance.dataSource,
  'cached_at': instance.cachedAt,
  '__metadata__': instance.metadata,
};
