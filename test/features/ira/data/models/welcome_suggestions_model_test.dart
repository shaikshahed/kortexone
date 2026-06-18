import 'package:flutter_test/flutter_test.dart';
import 'package:kortexone_mobile/features/ira/data/models/welcome_suggestions_request_model.dart';
import 'package:kortexone_mobile/features/ira/data/models/welcome_suggestions_response_model.dart';

void main() {
  group('WelcomeSuggestionsRequestModel', () {
    test('should serialize to JSON correctly', () {
      const model = WelcomeSuggestionsRequestModel(
        assistantId: '123',
        assistantName: 'HRMS',
        connectors: [],
      );

      final jsonMap = model.toJson();

      expect(jsonMap['assistant_id'], '123');
      expect(jsonMap['assistant_name'], 'HRMS');
      expect(jsonMap['connectors'], <String>[]);
    });

    test('should deserialize from JSON correctly', () {
      final jsonMap = {
        'assistant_id': '456',
        'assistant_name': 'Leave',
        'connectors': ['zoho'],
      };

      final model = WelcomeSuggestionsRequestModel.fromJson(jsonMap);

      expect(model.assistantId, '456');
      expect(model.assistantName, 'Leave');
      expect(model.connectors, ['zoho']);
    });
  });

  group('WelcomeSuggestionsResponseModel', () {
    test('should deserialize from JSON correctly', () {
      final jsonMap = {
        'suggestions': [
          'What is my leave balance?',
          'Show my profile details.'
        ],
        'live_connectors': ['zoho_people']
      };

      final model = WelcomeSuggestionsResponseModel.fromJson(jsonMap);

      expect(model.suggestions.length, 2);
      expect(model.suggestions[0], 'What is my leave balance?');
      expect(model.suggestions[1], 'Show my profile details.');
      expect(model.liveConnectors, ['zoho_people']);
    });

    test('should map to domain entity correctly', () {
      const model = WelcomeSuggestionsResponseModel(
        suggestions: ['A', 'B'],
        liveConnectors: ['C'],
      );

      final entity = model.toEntity();

      expect(entity.suggestions, ['A', 'B']);
      expect(entity.liveConnectors, ['C']);
    });
  });
}
