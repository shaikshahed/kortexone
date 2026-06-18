// ignore_for_file: unused_field

import 'dart:convert';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_client.dart';
import '../models/ira_agent_model.dart';
import '../models/ira_message_model.dart';
import '../models/ira_file_model.dart';
import '../models/ira_chat_response_model.dart';
import '../models/welcome_suggestions_request_model.dart';
import '../models/welcome_suggestions_response_model.dart';
import '../models/ira_messages_response_model.dart';
import '../models/ira_chat_request_model.dart';
import '../models/ira_chat_send_response_model.dart';

abstract class IraRemoteDataSource {
  Future<List<IraAgentModel>> getAgents();
  Future<String> getWelcomeMessage(String agentName);
  Future<List<IraChatModel>> getChatHistory(String agentId);
  Future<List<IraFileModel>> getFiles(String agentId);
  Future<IraMessageModel> sendMessage(String agentId, String text, {String? chatId, String? userEmail});
  Future<WelcomeSuggestionsResponseModel> getWelcomeSuggestions(WelcomeSuggestionsRequestModel request);
  Future<List<IraMessageModel>> getConversationMessages(String conversationId);
}

@LazySingleton(as: IraRemoteDataSource)
class IraRemoteDataSourceImpl implements IraRemoteDataSource {
  final ApiClient _apiClient;

  // Local chat history storage to simulate dynamic conversations in mock phase
  final Map<String, List<IraMessageModel>> _localChats = {};

  IraRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<IraAgentModel>> getAgents() async {
    try {
      final response = await _apiClient.get(
        '/platform/assistants',
        queryParameters: {
          'scope': 'chat',
        },
      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        final assistantsList = data['assistants'];
        if (assistantsList is List) {
          return assistantsList
              .map((json) => IraAgentModel.fromJson(json as Map<String, dynamic>))
              .toList();
        }
      }
    } catch (e) {
      // Graceful fallback to mock data on error/failure
    }

    return const [
      IraAgentModel(
        id: '6a2d2459063374a0a19554e7',
        name: 'HRMS',
        description: 'HR Management Agent',
        status: 'Active',
        iconPath: 'hrms',
      ),
      IraAgentModel(
        id: '6a30173adc700605a794a792',
        name: 'expense',
        description: 'Expense Processing Agent',
        status: 'Active',
        iconPath: 'expense',
      ),
      IraAgentModel(
        id: 'leave',
        name: 'leave',
        description: 'Leave Application Agent',
        status: 'Active',
        iconPath: 'leave',
      ),
      IraAgentModel(
        id: 'payroll',
        name: 'payroll',
        description: 'Payroll Inquiry Agent',
        status: 'Active',
        iconPath: 'payroll',
      ),
    ];
  }

  @override
  Future<String> getWelcomeMessage(String agentName) async {
    // Welcome message payload from API
    await Future.delayed(const Duration(milliseconds: 200));
    return 'Ask me anything about $agentName. I only access $agentName data sources.';
  }

  @override
  Future<List<IraChatModel>> getChatHistory(String agentId) async {
    try {
      final response = await _apiClient.get(
        '/chats',
        queryParameters: {
          'assistant_id': agentId,
        },
      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        final chatResponse = IraChatResponseModel.fromJson(response.data as Map<String, dynamic>);
        return chatResponse.chats;
      }
    } catch (e) {
      // Graceful fallback to mock data on error/failure
    }

    return [];
  }

  @override
  Future<List<IraMessageModel>> getConversationMessages(String conversationId) async {
    try {
      final response = await _apiClient.get('/chats/$conversationId/messages');
      if (response.data != null && response.data is Map<String, dynamic>) {
        final responseModel = IraMessagesResponseModel.fromJson(response.data as Map<String, dynamic>);
        return responseModel.messages.map((item) => IraMessageModel(
          id: item.id,
          agentId: '',
          sender: item.role,
          text: item.content,
          timestamp: item.createdAt,
        )).toList();
      }
    } catch (e) {
      // Graceful fallback
    }

    return [];
  }

  @override
  Future<List<IraFileModel>> getFiles(String agentId) async {
    final response = await _apiClient.get(
      '/documents',
      queryParameters: {
        'assistant_id': agentId,
      },
    );

    if (response.data != null && response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      final filesList = data['files'];
      if (filesList is List) {
        return filesList
            .map((json) => IraFileModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
    }

    return [];
  }

  @override
  Future<IraMessageModel> sendMessage(
    String agentId,
    String text, {
    String? chatId,
    String? userEmail,
  }) async {
    final email = (userEmail != null && userEmail.isNotEmpty)
        ? userEmail
        : "shashidhar.posham@engro.io";

    final request = IraChatRequestModel(
      message: text,
      userEmail: email,
      assistantId: agentId,
      chatId: chatId,
    );

    final response = await _apiClient.post(
      '/chat',
      data: request.toJson(),
    );

    if (response.data != null) {
      if (response.data is Map<String, dynamic>) {
        final parsed = response.data as Map<String, dynamic>;
        final sendResponse = IraChatSendResponseModel.fromJson(parsed);
        return IraMessageModel(
          id: sendResponse.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
          agentId: agentId,
          sender: 'assistant',
          text: sendResponse.answer ?? sendResponse.response ?? '',
          timestamp: DateTime.now().toIso8601String(),
          suggestions: sendResponse.suggestedQuestions,
          modelUsed: sendResponse.modelUsed,
          responseTimeMs: sendResponse.responseTimeMs,
          intent: sendResponse.intent,
          dataSource: sendResponse.dataSource,
          chatId: sendResponse.chatId,
        );
      } else {
        final responseBody = response.data.toString();
        final lines = responseBody.split('\n');
        for (final line in lines.reversed) {
          final trimmed = line.trim();
          if (trimmed.startsWith('{') && trimmed.endsWith('}')) {
            try {
              final parsed = jsonDecode(trimmed) as Map<String, dynamic>;
              if (parsed.containsKey('answer') || parsed.containsKey('chat_id') || parsed.containsKey('__metadata__')) {
                final sendResponse = IraChatSendResponseModel.fromJson(parsed);
                return IraMessageModel(
                  id: sendResponse.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
                  agentId: agentId,
                  sender: 'assistant',
                  text: sendResponse.answer ?? sendResponse.response ?? '',
                  timestamp: DateTime.now().toIso8601String(),
                  suggestions: sendResponse.suggestedQuestions,
                  modelUsed: sendResponse.modelUsed,
                  responseTimeMs: sendResponse.responseTimeMs,
                  intent: sendResponse.intent,
                  dataSource: sendResponse.dataSource,
                  chatId: sendResponse.chatId,
                );
              }
            } catch (_) {}
          }
        }
      }
    }

    throw Exception("Invalid or empty response from chat assistant API");
  }

  @override
  Future<WelcomeSuggestionsResponseModel> getWelcomeSuggestions(WelcomeSuggestionsRequestModel request) async {
    try {
      final response = await _apiClient.post(
        '/welcome-suggestions',
        data: request.toJson(),
      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        return WelcomeSuggestionsResponseModel.fromJson(response.data as Map<String, dynamic>);
      }
    } catch (e) {
      // Fallback to mock suggestions on error/failure
    }

    final name = request.assistantName.toLowerCase();
    List<String> fallbacks = [];
    if (name.contains('hrms')) {
      fallbacks = const [
        "What is my leave balance?",
        "Show my profile details.",
        "Who is my HR department?"
      ];
    } else if (name.contains('expense')) {
      fallbacks = const [
        "How do I submit an expense?",
        "What is the travel reimbursement policy?",
        "Show my pending expense reports."
      ];
    } else if (name.contains('leave')) {
      fallbacks = const [
        "How many leave days do I have remaining?",
        "Apply for annual leave next week.",
        "View holiday calendar."
      ];
    } else if (name.contains('payroll')) {
      fallbacks = const [
        "Show my last monthly payslip.",
        "What are my monthly tax deductions?",
        "When is the next payroll cycle?"
      ];
    } else {
      fallbacks = const [
        "How can you assist me?",
        "Show available integration tasks.",
        "What database connections are active?"
      ];
    }

    return WelcomeSuggestionsResponseModel(
      suggestions: fallbacks,
      liveConnectors: const [],
    );
  }
}
