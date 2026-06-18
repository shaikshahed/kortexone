// ignore_for_file: unused_field

import 'package:injectable/injectable.dart';
import '../../../../core/network/api_client.dart';
import '../models/ira_agent_model.dart';
import '../models/ira_message_model.dart';
import '../models/ira_file_model.dart';
import '../models/ira_chat_response_model.dart';
import '../models/welcome_suggestions_request_model.dart';
import '../models/welcome_suggestions_response_model.dart';

abstract class IraRemoteDataSource {
  Future<List<IraAgentModel>> getAgents();
  Future<String> getWelcomeMessage(String agentName);
  Future<List<IraMessageModel>> getChatHistory(String agentId);
  Future<List<IraFileModel>> getFiles(String agentId);
  Future<IraMessageModel> sendMessage(String agentId, String text);
  Future<WelcomeSuggestionsResponseModel> getWelcomeSuggestions(WelcomeSuggestionsRequestModel request);
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
  Future<List<IraMessageModel>> getChatHistory(String agentId) async {
    try {
      final response = await _apiClient.get(
        '/chats',
        queryParameters: {
          'assistant_id': agentId,
        },
      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        final chatResponse = IraChatResponseModel.fromJson(response.data as Map<String, dynamic>);
        final List<IraMessageModel> messages = [];

        for (final chat in chatResponse.chats) {
          messages.addAll(chat.toMessageModels());
        }

        // Sort chronologically (oldest messages first, newest last)
        messages.sort((a, b) {
          final timeA = DateTime.tryParse(a.timestamp) ?? DateTime.now();
          final timeB = DateTime.tryParse(b.timestamp) ?? DateTime.now();
          return timeA.compareTo(timeB);
        });

        return messages;
      }
    } catch (e) {
      // Graceful fallback to mock data on error/failure
    }

    return _localChats[agentId] ?? [];
  }

  @override
  Future<List<IraFileModel>> getFiles(String agentId) async {
    try {
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
    } catch (e) {
      // Graceful fallback to mock data on error/failure
    }

    if (agentId == 'hrms' || agentId == '6a2d2459063374a0a19554e7') {
      return const [
        IraFileModel(id: 'f1', agentId: '6a2d2459063374a0a19554e7', name: 'maths.pdf', extension: 'pdf', sizeString: '1.2 MB'),
        IraFileModel(id: 'f2', agentId: '6a2d2459063374a0a19554e7', name: '15-MB-docx-file-sample.docx', extension: 'docx', sizeString: '15.0 MB'),
        IraFileModel(id: 'f3', agentId: '6a2d2459063374a0a19554e7', name: 'Code-of-Conduct-Policy.pdf', extension: 'pdf', sizeString: '850 KB'),
        IraFileModel(id: 'f4', agentId: '6a2d2459063374a0a19554e7', name: 'Clean Desk Policy.pdf', extension: 'pdf', sizeString: '320 KB'),
        IraFileModel(id: 'f5', agentId: '6a2d2459063374a0a19554e7', name: 'Leave Policy_Engr_v2.pdf', extension: 'pdf', sizeString: '1.8 MB'),
      ];
    } else if (agentId == 'expense' || agentId == '6a30173adc700605a794a792') {
      return const [
        IraFileModel(id: 'f6', agentId: '6a30173adc700605a794a792', name: 'travel_reimbursement_policy.pdf', extension: 'pdf', sizeString: '2.4 MB'),
        IraFileModel(id: 'f7', agentId: '6a30173adc700605a794a792', name: 'receipt_submission_guide.pdf', extension: 'pdf', sizeString: '950 KB'),
      ];
    } else if (agentId == 'leave') {
      return const [
        IraFileModel(id: 'f8', agentId: 'leave', name: 'maternity_paternity_policy.pdf', extension: 'pdf', sizeString: '3.1 MB'),
        IraFileModel(id: 'f9', agentId: 'leave', name: 'holiday_calendar_2026.pdf', extension: 'pdf', sizeString: '420 KB'),
      ];
    } else {
      return const [
        IraFileModel(id: 'f10', agentId: 'payroll', name: 'tax_declaration_guide.pdf', extension: 'pdf', sizeString: '1.1 MB'),
        IraFileModel(id: 'f11', agentId: 'payroll', name: 'payslip_december_2025.pdf', extension: 'pdf', sizeString: '250 KB'),
      ];
    }
  }

  @override
  Future<IraMessageModel> sendMessage(String agentId, String text) async {
    // Simulate response delay
    await Future.delayed(const Duration(milliseconds: 1000));

    // Append user message
    final userMsg = IraMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      agentId: agentId,
      sender: 'user',
      text: text,
      timestamp: DateTime.now().toIso8601String(),
    );
    _localChats.putIfAbsent(agentId, () => []).add(userMsg);

    // Formulate reply based on agent type
    String replyText = '';
    if (agentId == 'expense' || agentId == '6a30173adc700605a794a792') {
      replyText = "I've reviewed your request about expenses. Under our current policy, you can submit receipts up to 30 days after the expense date. Let me know if you would like me to compile or draft an expense report for you.";
    } else if (agentId == 'hrms' || agentId == '6a2d2459063374a0a19554e7') {
      replyText = "According to the HRMS portal policies, all standard employee documentation is indexed under KORTEX database sources. How can I help you find specific onboarding or code-of-conduct information?";
    } else if (agentId == 'leave') {
      replyText = "Standard annual leave entitlement is 20 days. You have 8 days remaining this cycle. Would you like me to request time off for a particular block of dates?";
    } else {
      replyText = "I can access your payroll and payslip history. Your latest monthly pay statement was finalized on June 1st. Would you like a breakdown of deductions or bonuses?";
    }

    final assistantMsg = IraMessageModel(
      id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
      agentId: agentId,
      sender: 'assistant',
      text: replyText,
      timestamp: DateTime.now().toIso8601String(),
    );
    _localChats[agentId]!.add(assistantMsg);

    return assistantMsg;
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
