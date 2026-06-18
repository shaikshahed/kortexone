import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:kortexone_mobile/features/ira/data/models/ira_chat_response_model.dart';

void main() {
  group('IraChatResponseModel', () {
    test('should parse json correctly and map to message models', () {
      const jsonString = '''
      {
          "chats": [
              {
                  "id": "6a314dfacf6223b6648fd681",
                  "title": "How much vacation leave does an employee...",
                  "created_at": "2026-06-16T13:22:02.596000Z",
                  "updated_at": "2026-06-16T13:26:14.922000Z",
                  "assistant_id": "6a2d2459063374a0a19554e7"
              }
          ]
      }
      ''';

      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      final responseModel = IraChatResponseModel.fromJson(jsonMap);

      expect(responseModel.chats.length, 1);
      
      final chat = responseModel.chats.first;
      expect(chat.id, '6a314dfacf6223b6648fd681');
      expect(chat.title, 'How much vacation leave does an employee...');
      expect(chat.createdAt, '2026-06-16T13:22:02.596000Z');
      expect(chat.updatedAt, '2026-06-16T13:26:14.922000Z');
      expect(chat.assistantId, '6a2d2459063374a0a19554e7');

      final messageModels = chat.toMessageModels();
      expect(messageModels.length, 2);

      final userMsg = messageModels[0];
      expect(userMsg.id, '6a314dfacf6223b6648fd681_user');
      expect(userMsg.agentId, '6a2d2459063374a0a19554e7');
      expect(userMsg.sender, 'user');
      expect(userMsg.text, 'How much vacation leave does an employee...');
      expect(userMsg.timestamp, '2026-06-16T13:22:02.596000Z');

      final assistantMsg = messageModels[1];
      expect(assistantMsg.id, '6a314dfacf6223b6648fd681_assistant');
      expect(assistantMsg.agentId, '6a2d2459063374a0a19554e7');
      expect(assistantMsg.sender, 'assistant');
      expect(assistantMsg.text.contains("How much vacation leave does an employee..."), true);
      expect(assistantMsg.timestamp, '2026-06-16T13:26:14.922000Z');
    });
  });
}
