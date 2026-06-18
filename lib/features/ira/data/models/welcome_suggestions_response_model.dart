import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/welcome_suggestions.dart';

part 'welcome_suggestions_response_model.freezed.dart';
part 'welcome_suggestions_response_model.g.dart';

@freezed
abstract class WelcomeSuggestionsResponseModel with _$WelcomeSuggestionsResponseModel {
  const factory WelcomeSuggestionsResponseModel({
    required List<String> suggestions,
    @JsonKey(name: 'live_connectors') required List<String> liveConnectors,
  }) = _WelcomeSuggestionsResponseModel;

  factory WelcomeSuggestionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WelcomeSuggestionsResponseModelFromJson(json);

  const WelcomeSuggestionsResponseModel._();

  WelcomeSuggestions toEntity() => WelcomeSuggestions(
        suggestions: suggestions,
        liveConnectors: liveConnectors,
      );
}
