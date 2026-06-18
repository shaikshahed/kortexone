import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_suggestions_request_model.freezed.dart';
part 'welcome_suggestions_request_model.g.dart';

@freezed
abstract class WelcomeSuggestionsRequestModel with _$WelcomeSuggestionsRequestModel {
  const factory WelcomeSuggestionsRequestModel({
    @JsonKey(name: 'assistant_id') required String assistantId,
    @JsonKey(name: 'assistant_name') required String assistantName,
    @Default([]) List<String> connectors,
  }) = _WelcomeSuggestionsRequestModel;

  factory WelcomeSuggestionsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WelcomeSuggestionsRequestModelFromJson(json);
}
