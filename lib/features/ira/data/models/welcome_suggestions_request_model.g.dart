// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_suggestions_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WelcomeSuggestionsRequestModel _$WelcomeSuggestionsRequestModelFromJson(
  Map<String, dynamic> json,
) => _WelcomeSuggestionsRequestModel(
  assistantId: json['assistant_id'] as String,
  assistantName: json['assistant_name'] as String,
  connectors:
      (json['connectors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$WelcomeSuggestionsRequestModelToJson(
  _WelcomeSuggestionsRequestModel instance,
) => <String, dynamic>{
  'assistant_id': instance.assistantId,
  'assistant_name': instance.assistantName,
  'connectors': instance.connectors,
};
