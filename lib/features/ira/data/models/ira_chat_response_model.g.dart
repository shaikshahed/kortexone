// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ira_chat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IraChatModel _$IraChatModelFromJson(Map<String, dynamic> json) =>
    _IraChatModel(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      assistantId: json['assistant_id'] as String,
    );

Map<String, dynamic> _$IraChatModelToJson(_IraChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'assistant_id': instance.assistantId,
    };

_IraChatResponseModel _$IraChatResponseModelFromJson(
  Map<String, dynamic> json,
) => _IraChatResponseModel(
  chats: (json['chats'] as List<dynamic>)
      .map((e) => IraChatModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$IraChatResponseModelToJson(
  _IraChatResponseModel instance,
) => <String, dynamic>{'chats': instance.chats};
