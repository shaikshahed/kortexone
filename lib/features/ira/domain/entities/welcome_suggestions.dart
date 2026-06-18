import 'package:equatable/equatable.dart';

class WelcomeSuggestions extends Equatable {
  final List<String> suggestions;
  final List<String> liveConnectors;

  const WelcomeSuggestions({
    required this.suggestions,
    required this.liveConnectors,
  });

  @override
  List<Object?> get props => [suggestions, liveConnectors];
}
