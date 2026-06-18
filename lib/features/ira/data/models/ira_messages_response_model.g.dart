// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ira_messages_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IraMessageItemModel _$IraMessageItemModelFromJson(Map<String, dynamic> json) =>
    _IraMessageItemModel(
      id: json['id'] as String,
      role: json['role'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$IraMessageItemModelToJson(
  _IraMessageItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'role': instance.role,
  'content': instance.content,
  'created_at': instance.createdAt,
};

_IraMessagesResponseModel _$IraMessagesResponseModelFromJson(
  Map<String, dynamic> json,
) => _IraMessagesResponseModel(
  messages: (json['messages'] as List<dynamic>)
      .map((e) => IraMessageItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$IraMessagesResponseModelToJson(
  _IraMessagesResponseModel instance,
) => <String, dynamic>{'messages': instance.messages};
