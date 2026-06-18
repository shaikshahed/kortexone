// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_suggestions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WelcomeSuggestionsResponseModel _$WelcomeSuggestionsResponseModelFromJson(
  Map<String, dynamic> json,
) => _WelcomeSuggestionsResponseModel(
  suggestions: (json['suggestions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  liveConnectors: (json['live_connectors'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$WelcomeSuggestionsResponseModelToJson(
  _WelcomeSuggestionsResponseModel instance,
) => <String, dynamic>{
  'suggestions': instance.suggestions,
  'live_connectors': instance.liveConnectors,
};
