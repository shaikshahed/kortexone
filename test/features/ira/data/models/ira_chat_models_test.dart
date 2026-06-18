import 'package:flutter_test/flutter_test.dart';
import 'package:kortexone_mobile/features/ira/data/models/ira_chat_request_model.dart';
import 'package:kortexone_mobile/features/ira/data/models/ira_chat_send_response_model.dart';

void main() {
  group('IraChatRequestModel', () {
    test('should serialize to JSON correctly', () {
      const model = IraChatRequestModel(
        message: 'Hi',
        userEmail: 'test@engro.io',
        assistantId: '6a2d2459063374a0a19554e7',
        chatId: 'chat_123',
      );

      final jsonMap = model.toJson();

      expect(jsonMap['message'], 'Hi');
      expect(jsonMap['user_email'], 'test@engro.io');
      expect(jsonMap['assistant_id'], '6a2d2459063374a0a19554e7');
      expect(jsonMap['chat_id'], 'chat_123');
      expect(jsonMap['model'], 'gemini-2.5-flash');
      expect(jsonMap['stream'], true);
    });
  });

  group('IraChatSendResponseModel', () {
    test('should deserialize from JSON correctly', () {
      final jsonMap = {
        'answer': 'Hello!',
        'suggested_questions': ['A', 'B'],
        'chat_id': 'chat_999',
        'model_used': 'gemini-2.5-flash',
        'response_time_ms': 1200.0,
      };

      final model = IraChatSendResponseModel.fromJson(jsonMap);

      expect(model.answer, 'Hello!');
      expect(model.suggestedQuestions, ['A', 'B']);
      expect(model.chatId, 'chat_999');
      expect(model.modelUsed, 'gemini-2.5-flash');
      expect(model.responseTimeMs, 1200.0);
    });
  });
}
