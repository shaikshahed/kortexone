import 'package:equatable/equatable.dart';
import '../../domain/entities/ira_agent.dart';
import '../../domain/entities/ira_message.dart';
import '../../domain/entities/ira_file.dart';
import '../../domain/entities/ira_conversation.dart';

enum IraStatus { initial, loading, success, failure }

class IraState extends Equatable {
  final IraStatus status;
  final List<IraAgent> agents;
  final IraAgent? selectedAgent;
  final String welcomeMessage;
  final List<IraMessage> messages;
  final List<IraFile> files;
  final List<IraFile> filteredFiles;
  final String searchQuery;
  final int activeTab;
  final String? errorMessage;
  final bool isSending;
  final List<String> suggestions;
  final IraStatus suggestionsStatus;
  final List<String> liveConnectors;
  final List<IraConversation> conversations;
  final IraConversation? selectedConversation;
  final IraStatus historyStatus;
  final IraStatus messagesStatus;
  final IraStatus filesStatus;

  const IraState({
    this.status = IraStatus.initial,
    this.agents = const [],
    this.selectedAgent,
    this.welcomeMessage = '',
    this.messages = const [],
    this.files = const [],
    this.filteredFiles = const [],
    this.searchQuery = '',
    this.activeTab = 0,
    this.errorMessage,
    this.isSending = false,
    this.suggestions = const [],
    this.suggestionsStatus = IraStatus.initial,
    this.liveConnectors = const [],
    this.conversations = const [],
    this.selectedConversation,
    this.historyStatus = IraStatus.initial,
    this.messagesStatus = IraStatus.initial,
    this.filesStatus = IraStatus.initial,
  });

  IraState copyWith({
    IraStatus? status,
    List<IraAgent>? agents,
    IraAgent? selectedAgent,
    String? welcomeMessage,
    List<IraMessage>? messages,
    List<IraFile>? files,
    List<IraFile>? filteredFiles,
    String? searchQuery,
    int? activeTab,
    String? errorMessage,
    bool? isSending,
    List<String>? suggestions,
    IraStatus? suggestionsStatus,
    List<String>? liveConnectors,
    List<IraConversation>? conversations,
    IraConversation? selectedConversation,
    bool clearSelectedConversation = false,
    IraStatus? historyStatus,
    IraStatus? messagesStatus,
    IraStatus? filesStatus,
  }) {
    return IraState(
      status: status ?? this.status,
      agents: agents ?? this.agents,
      selectedAgent: selectedAgent ?? this.selectedAgent,
      welcomeMessage: welcomeMessage ?? this.welcomeMessage,
      messages: messages ?? this.messages,
      files: files ?? this.files,
      filteredFiles: filteredFiles ?? this.filteredFiles,
      searchQuery: searchQuery ?? this.searchQuery,
      activeTab: activeTab ?? this.activeTab,
      errorMessage: errorMessage ?? this.errorMessage,
      isSending: isSending ?? this.isSending,
      suggestions: suggestions ?? this.suggestions,
      suggestionsStatus: suggestionsStatus ?? this.suggestionsStatus,
      liveConnectors: liveConnectors ?? this.liveConnectors,
      conversations: conversations ?? this.conversations,
      selectedConversation: clearSelectedConversation
          ? null
          : (selectedConversation ?? this.selectedConversation),
      historyStatus: historyStatus ?? this.historyStatus,
      messagesStatus: messagesStatus ?? this.messagesStatus,
      filesStatus: filesStatus ?? this.filesStatus,
    );
  }

  @override
  List<Object?> get props => [
        status,
        agents,
        selectedAgent,
        welcomeMessage,
        messages,
        files,
        filteredFiles,
        searchQuery,
        activeTab,
        errorMessage,
        isSending,
        suggestions,
        suggestionsStatus,
        liveConnectors,
        conversations,
        selectedConversation,
        historyStatus,
        messagesStatus,
        filesStatus,
      ];
}
