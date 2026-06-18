// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ira_chat_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IraChatRequestModel _$IraChatRequestModelFromJson(Map<String, dynamic> json) =>
    _IraChatRequestModel(
      message: json['message'] as String,
      userEmail: json['user_email'] as String,
      model: json['model'] as String? ?? 'gemini-2.5-flash',
      stream: json['stream'] as bool? ?? true,
      frappeState: json['frappe_state'] as String?,
      agentType: json['agent_type'] as String? ?? 'zoho',
      assistantId: json['assistant_id'] as String,
      chatId: json['chat_id'] as String?,
    );

Map<String, dynamic> _$IraChatRequestModelToJson(
  _IraChatRequestModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'user_email': instance.userEmail,
  'model': instance.model,
  'stream': instance.stream,
  'frappe_state': instance.frappeState,
  'agent_type': instance.agentType,
  'assistant_id': instance.assistantId,
  'chat_id': instance.chatId,
};
