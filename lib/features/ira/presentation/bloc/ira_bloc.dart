import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/ira_message.dart';
import '../../domain/entities/ira_file.dart';
import '../../domain/usecases/get_agents_usecase.dart';
import '../../domain/usecases/get_welcome_message_usecase.dart';
import '../../domain/usecases/get_chat_history_usecase.dart';
import '../../domain/usecases/get_files_usecase.dart';
import '../../domain/usecases/send_message_usecase.dart';
import '../../domain/usecases/get_welcome_suggestions_usecase.dart';
import 'ira_event.dart';
import 'ira_state.dart';

@injectable
class IraBloc extends Bloc<IraEvent, IraState> {
  final GetAgentsUseCase _getAgentsUseCase;
  final GetWelcomeMessageUseCase _getWelcomeMessageUseCase;
  final GetChatHistoryUseCase _getChatHistoryUseCase;
  final GetFilesUseCase _getFilesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final GetWelcomeSuggestionsUseCase _getWelcomeSuggestionsUseCase;

  IraBloc(
    this._getAgentsUseCase,
    this._getWelcomeMessageUseCase,
    this._getChatHistoryUseCase,
    this._getFilesUseCase,
    this._sendMessageUseCase,
    this._getWelcomeSuggestionsUseCase,
  ) : super(const IraState()) {
    on<IraLoadInitial>(_onIraLoadInitial);
    on<IraSelectAgent>(_onIraSelectAgent);
    on<IraSendMessage>(_onIraSendMessage);
    on<IraSearchFiles>(_onIraSearchFiles);
    on<IraChangeTab>(_onIraChangeTab);
  }

  Future<void> _onIraLoadInitial(
    IraLoadInitial event,
    Emitter<IraState> emit,
  ) async {
    emit(state.copyWith(
      status: IraStatus.loading,
      suggestionsStatus: IraStatus.loading,
    ));
    final agentsResult = await _getAgentsUseCase(const NoParams());

    await agentsResult.fold(
      (failure) async {
        emit(state.copyWith(
          status: IraStatus.failure,
          suggestionsStatus: IraStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (agents) async {
        if (agents.isNotEmpty) {
          final firstAgent = agents.first;

          final welcomeResult = await _getWelcomeMessageUseCase(firstAgent.name);
          final chatsResult = await _getChatHistoryUseCase(firstAgent.id);
          final filesResult = await _getFilesUseCase(firstAgent.id);
          final suggestionsResult = await _getWelcomeSuggestionsUseCase(
            WelcomeSuggestionsParams(
              assistantId: firstAgent.id,
              assistantName: firstAgent.name,
            ),
          );

          String welcomeMsg = '';
          welcomeResult.fold((_) {}, (msg) => welcomeMsg = msg);

          List<IraMessage> messages = [];
          chatsResult.fold((_) {}, (list) => messages = list);

          List<IraFile> files = [];
          filesResult.fold((_) {}, (list) => files = list);

          List<String> suggestions = [];
          IraStatus suggestionsStatus = IraStatus.failure;
          suggestionsResult.fold(
            (_) => suggestionsStatus = IraStatus.failure,
            (ws) {
              suggestions = ws.suggestions;
              suggestionsStatus = IraStatus.success;
            },
          );

          emit(state.copyWith(
            status: IraStatus.success,
            agents: agents,
            selectedAgent: firstAgent,
            welcomeMessage: welcomeMsg,
            messages: messages,
            files: files,
            filteredFiles: files,
            searchQuery: '',
            suggestions: suggestions,
            suggestionsStatus: suggestionsStatus,
          ));
        } else {
          emit(state.copyWith(
            status: IraStatus.success,
            agents: const [],
            selectedAgent: null,
            suggestions: const [],
            suggestionsStatus: IraStatus.success,
          ));
        }
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
      selectedAgent: event.agent,
      messages: const [],
      files: const [],
      filteredFiles: const [],
      searchQuery: '',
      suggestions: const [],
    ));

    final welcomeResult = await _getWelcomeMessageUseCase(event.agent.name);
    final chatsResult = await _getChatHistoryUseCase(event.agent.id);
    final filesResult = await _getFilesUseCase(event.agent.id);
    final suggestionsResult = await _getWelcomeSuggestionsUseCase(
      WelcomeSuggestionsParams(
        assistantId: event.agent.id,
        assistantName: event.agent.name,
      ),
    );

    String welcomeMsg = '';
    welcomeResult.fold((_) {}, (msg) => welcomeMsg = msg);

    List<IraMessage> messages = [];
    chatsResult.fold((_) {}, (list) => messages = list);

    List<IraFile> files = [];
    filesResult.fold((_) {}, (list) => files = list);

    List<String> suggestions = [];
    IraStatus suggestionsStatus = IraStatus.failure;
    suggestionsResult.fold(
      (_) => suggestionsStatus = IraStatus.failure,
      (ws) {
        suggestions = ws.suggestions;
        suggestionsStatus = IraStatus.success;
      },
    );

    emit(state.copyWith(
      status: IraStatus.success,
      welcomeMessage: welcomeMsg,
      messages: messages,
      files: files,
      filteredFiles: files,
      suggestions: suggestions,
      suggestionsStatus: suggestionsStatus,
    ));
  }

  Future<void> _onIraSendMessage(
    IraSendMessage event,
    Emitter<IraState> emit,
  ) async {
    final agent = state.selectedAgent;
    if (agent == null || event.text.trim().isEmpty) return;

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
        emit(state.copyWith(
          isSending: false,
          messages: finalMessages,
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
}
