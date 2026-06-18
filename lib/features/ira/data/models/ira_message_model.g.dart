// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ira_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IraMessageModel _$IraMessageModelFromJson(Map<String, dynamic> json) =>
    _IraMessageModel(
      id: json['id'] as String,
      agentId: json['agentId'] as String,
      sender: json['sender'] as String,
      text: json['text'] as String,
      timestamp: json['timestamp'] as String,
      suggestions: (json['suggestions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      modelUsed: json['modelUsed'] as String?,
      responseTimeMs: (json['responseTimeMs'] as num?)?.toDouble(),
      intent: json['intent'] as String?,
      dataSource: json['dataSource'] as String?,
      chatId: json['chatId'] as String?,
    );

Map<String, dynamic> _$IraMessageModelToJson(_IraMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agentId': instance.agentId,
      'sender': instance.sender,
      'text': instance.text,
      'timestamp': instance.timestamp,
      'suggestions': instance.suggestions,
      'modelUsed': instance.modelUsed,
      'responseTimeMs': instance.responseTimeMs,
      'intent': instance.intent,
      'dataSource': instance.dataSource,
      'chatId': instance.chatId,
    };
