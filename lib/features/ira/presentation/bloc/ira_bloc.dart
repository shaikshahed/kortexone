import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/ira_message.dart';
import '../../domain/entities/ira_file.dart';
import '../../domain/entities/ira_agent.dart';
import '../../domain/entities/ira_conversation.dart';
import '../../domain/entities/welcome_suggestions.dart';
import '../../domain/usecases/get_agents_usecase.dart';
import '../../domain/usecases/get_welcome_message_usecase.dart';
import '../../domain/usecases/get_chat_history_usecase.dart';
import '../../domain/usecases/get_files_usecase.dart';
import '../../domain/usecases/send_message_usecase.dart';
import '../../domain/usecases/get_welcome_suggestions_usecase.dart';
import '../../domain/usecases/get_conversation_messages_usecase.dart';
import 'ira_event.dart';
import 'ira_state.dart';

@injectable
class IraBloc extends Bloc<IraEvent, IraState> {
  static const IraAgent defaultAgent = IraAgent(
    id: '6a2d2459063374a0a19554e7',
    name: 'HRMS',
    description: 'HR Management Agent',
    status: 'Active',
    iconPath: 'hrms',
  );

  final GetAgentsUseCase _getAgentsUseCase;
  final GetWelcomeMessageUseCase _getWelcomeMessageUseCase;
  final GetChatHistoryUseCase _getChatHistoryUseCase;
  final GetFilesUseCase _getFilesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final GetWelcomeSuggestionsUseCase _getWelcomeSuggestionsUseCase;
  final GetConversationMessagesUseCase _getConversationMessagesUseCase;

  IraBloc(
    this._getAgentsUseCase,
    this._getWelcomeMessageUseCase,
    this._getChatHistoryUseCase,
    this._getFilesUseCase,
    this._sendMessageUseCase,
    this._getWelcomeSuggestionsUseCase,
    this._getConversationMessagesUseCase,
  ) : super(const IraState()) {
    on<IraLoadInitial>(_onIraLoadInitial);
    on<IraLoadAgents>(_onIraLoadAgents);
    on<IraSelectAgent>(_onIraSelectAgent);
    on<IraSendMessage>(_onIraSendMessage);
    on<IraSearchFiles>(_onIraSearchFiles);
    on<IraChangeTab>(_onIraChangeTab);
    on<IraLoadConversations>(_onIraLoadConversations);
    on<IraSelectConversation>(_onIraSelectConversation);
    on<IraCreateNewConversation>(_onIraCreateNewConversation);
    on<IraLoadFiles>(_onIraLoadFiles);
  }

  Future<void> _onIraLoadInitial(
    IraLoadInitial event,
    Emitter<IraState> emit,
  ) async {
    emit(state.copyWith(
      status: IraStatus.loading,
      suggestionsStatus: IraStatus.loading,
      historyStatus: IraStatus.loading,
      filesStatus: IraStatus.loading,
      selectedAgent: defaultAgent,
      agents: const [defaultAgent],
      clearSelectedConversation: true,
      messages: const [],
    ));

    final results = await Future.wait([
      _getWelcomeMessageUseCase(defaultAgent.name),
      _getChatHistoryUseCase(defaultAgent.id),
      _getFilesUseCase(defaultAgent.id),
      _getWelcomeSuggestionsUseCase(
        WelcomeSuggestionsParams(
          assistantId: defaultAgent.id,
          assistantName: defaultAgent.name,
        ),
      ),
    ]);

    final welcomeResult = results[0] as Either<Failure, String>;
    final chatsResult = results[1] as Either<Failure, List<IraConversation>>;
    final filesResult = results[2] as Either<Failure, List<IraFile>>;
    final suggestionsResult = results[3] as Either<Failure, WelcomeSuggestions>;

    String welcomeMsg = '';
    welcomeResult.fold((_) {}, (msg) => welcomeMsg = msg);

    List<IraConversation> conversations = [];
    chatsResult.fold((_) {}, (list) => conversations = list);

    List<IraFile> files = [];
    IraStatus filesStatus = IraStatus.failure;
    filesResult.fold(
      (failure) => filesStatus = IraStatus.failure,
      (list) {
        files = list;
        filesStatus = IraStatus.success;
      },
    );

    List<String> suggestions = [];
    List<String> liveConnectors = [];
    IraStatus suggestionsStatus = IraStatus.failure;
    suggestionsResult.fold(
      (_) => suggestionsStatus = IraStatus.failure,
      (ws) {
        suggestions = ws.suggestions;
        liveConnectors = ws.liveConnectors;
        suggestionsStatus = IraStatus.success;
      },
    );

    emit(state.copyWith(
      status: IraStatus.success,
      selectedAgent: defaultAgent,
      welcomeMessage: welcomeMsg,
      messages: const [],
      files: files,
      filteredFiles: files,
      searchQuery: '',
      suggestions: suggestions,
      suggestionsStatus: suggestionsStatus,
      liveConnectors: liveConnectors,
      conversations: conversations,
      historyStatus: IraStatus.success,
      filesStatus: filesStatus,
      clearSelectedConversation: true,
    ));
  }

  Future<void> _onIraLoadAgents(
    IraLoadAgents event,
    Emitter<IraState> emit,
  ) async {
    final agentsResult = await _getAgentsUseCase(const NoParams());
    agentsResult.fold(
      (_) {},
      (agents) {
        emit(state.copyWith(
          agents: agents,
        ));
      },
    );
  }

  Future<void> _onIraSelectAgent(
    IraSelectAgent event,
    Emitter<IraState> emit,
  ) async {
    emit(state.copyWith(
      status: IraStatus.loading,
      suggestionsStatus: IraStatus.loading,
      historyStatus: IraStatus.loading,
      filesStatus: IraStatus.loading,
      selectedAgent: event.agent,
      messages: const [],
      files: const [],
      filteredFiles: const [],
      searchQuery: '',
      suggestions: const [],
      liveConnectors: const [],
      clearSelectedConversation: true,
    ));

    final results = await Future.wait([
      _getWelcomeMessageUseCase(event.agent.name),
      _getChatHistoryUseCase(event.agent.id),
      _getFilesUseCase(event.agent.id),
      _getWelcomeSuggestionsUseCase(
        WelcomeSuggestionsParams(
          assistantId: event.agent.id,
          assistantName: event.agent.name,
        ),
      ),
    ]);

    final welcomeResult = results[0] as Either<Failure, String>;
    final chatsResult = results[1] as Either<Failure, List<IraConversation>>;
    final filesResult = results[2] as Either<Failure, List<IraFile>>;
    final suggestionsResult = results[3] as Either<Failure, WelcomeSuggestions>;

    String welcomeMsg = '';
    welcomeResult.fold((_) {}, (msg) => welcomeMsg = msg);

    List<IraConversation> conversations = [];
    chatsResult.fold((_) {}, (list) => conversations = list);

    List<IraFile> files = [];
    IraStatus filesStatus = IraStatus.failure;
    filesResult.fold(
      (failure) => filesStatus = IraStatus.failure,
      (list) {
        files = list;
        filesStatus = IraStatus.success;
      },
    );

    List<String> suggestions = [];
    List<String> liveConnectors = [];
    IraStatus suggestionsStatus = IraStatus.failure;
    suggestionsResult.fold(
      (_) => suggestionsStatus = IraStatus.failure,
      (ws) {
        suggestions = ws.suggestions;
        liveConnectors = ws.liveConnectors;
        suggestionsStatus = IraStatus.success;
      },
    );

    emit(state.copyWith(
      status: IraStatus.success,
      welcomeMessage: welcomeMsg,
      messages: const [],
      files: files,
      filteredFiles: files,
      suggestions: suggestions,
      suggestionsStatus: suggestionsStatus,
      liveConnectors: liveConnectors,
      conversations: conversations,
      historyStatus: IraStatus.success,
      filesStatus: filesStatus,
      clearSelectedConversation: true,
    ));
  }

  Future<void> _onIraLoadConversations(
    IraLoadConversations event,
    Emitter<IraState> emit,
  ) async {
    final agent = state.selectedAgent;
    if (agent == null) return;

    emit(state.copyWith(historyStatus: IraStatus.loading));
    final chatsResult = await _getChatHistoryUseCase(agent.id);
    chatsResult.fold(
      (failure) => emit(state.copyWith(historyStatus: IraStatus.failure)),
      (conversations) => emit(state.copyWith(
        conversations: conversations,
        historyStatus: IraStatus.success,
      )),
    );
  }

  Future<void> _onIraSelectConversation(
    IraSelectConversation event,
    Emitter<IraState> emit,
  ) async {
    emit(state.copyWith(
      selectedConversation: event.conversation,
      messagesStatus: IraStatus.loading,
      messages: const [],
    ));

    final result = await _getConversationMessagesUseCase(event.conversation.id);
    result.fold(
      (failure) {
        emit(state.copyWith(
          messagesStatus: IraStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (messages) {
        // Sort chronologically (oldest messages first, newest last)
        final sortedMessages = List<IraMessage>.from(messages)
          ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

        emit(state.copyWith(
          messagesStatus: IraStatus.success,
          messages: sortedMessages,
        ));
      },
    );
  }

  Future<void> _onIraCreateNewConversation(
    IraCreateNewConversation event,
    Emitter<IraState> emit,
  ) async {
    emit(state.copyWith(
      clearSelectedConversation: true,
      messages: const [],
      messagesStatus: IraStatus.initial,
    ));
  }

  Future<void> _onIraSendMessage(
    IraSendMessage event,
    Emitter<IraState> emit,
  ) async {
    final agent = state.selectedAgent;
    if (agent == null || event.text.trim().isEmpty) return;
    if (state.isSending) return;

    final userMsg = IraMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      agentId: agent.id,
      sender: MessageSender.user,
      text: event.text,
      timestamp: DateTime.now(),
    );

    final updatedMessages = List<IraMessage>.from(state.messages)..add(userMsg);
    emit(state.copyWith(
      messages: updatedMessages,
      isSending: true,
    ));

    final sendResult = await _sendMessageUseCase(SendMessageParams(
      agentId: agent.id,
      text: event.text,
      chatId: state.selectedConversation?.id,
      userEmail: event.userEmail,
    ));

    sendResult.fold(
      (failure) {
        emit(state.copyWith(
          isSending: false,
          errorMessage: failure.message,
        ));
      },
      (reply) {
        final finalMessages = List<IraMessage>.from(state.messages)..add(reply);
        
        // Handle new conversation creation or existing conversation updates
        final currentConv = state.selectedConversation;
        List<IraConversation> updatedConvs = List.from(state.conversations);
        IraConversation? nextSelectedConv = currentConv;

        if (currentConv == null && reply.chatId != null) {
          final newConv = IraConversation(
            id: reply.chatId!,
            title: event.text,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            assistantId: agent.id,
          );
          updatedConvs.insert(0, newConv);
          nextSelectedConv = newConv;
        } else if (currentConv != null) {
          final index = updatedConvs.indexWhere((c) => c.id == currentConv.id);
          final updatedConv = currentConv.copyWith(updatedAt: DateTime.now());
          if (index != -1) {
            updatedConvs.removeAt(index);
          }
          updatedConvs.insert(0, updatedConv);
          nextSelectedConv = updatedConv;
        }

        emit(state.copyWith(
          isSending: false,
          messages: finalMessages,
          conversations: updatedConvs,
          selectedConversation: nextSelectedConv,
        ));
      },
    );
  }

  void _onIraSearchFiles(
    IraSearchFiles event,
    Emitter<IraState> emit,
  ) {
    final query = event.query.toLowerCase();
    if (query.isEmpty) {
      emit(state.copyWith(
        filteredFiles: state.files,
        searchQuery: '',
      ));
    } else {
      final filtered = state.files
          .where((f) => f.name.toLowerCase().contains(query))
          .toList();
      emit(state.copyWith(
        filteredFiles: filtered,
        searchQuery: event.query,
      ));
    }
  }

  void _onIraChangeTab(
    IraChangeTab event,
    Emitter<IraState> emit,
  ) {
    emit(state.copyWith(activeTab: event.tabIndex));
  }

  Future<void> _onIraLoadFiles(
    IraLoadFiles event,
    Emitter<IraState> emit,
  ) async {
    emit(state.copyWith(
      filesStatus: IraStatus.loading,
    ));

    final filesResult = await _getFilesUseCase(event.agentId);

    List<IraFile> files = [];
    IraStatus filesStatus = IraStatus.failure;
    filesResult.fold(
      (failure) => filesStatus = IraStatus.failure,
      (list) {
        files = list;
        filesStatus = IraStatus.success;
      },
    );

    emit(state.copyWith(
      files: files,
      filteredFiles: files,
      filesStatus: filesStatus,
    ));
  }
}
