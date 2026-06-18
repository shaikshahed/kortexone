import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/ira_agent.dart';
import '../entities/ira_message.dart';
import '../entities/ira_file.dart';
import '../entities/welcome_suggestions.dart';
import '../entities/ira_conversation.dart';

abstract class IraRepository {
  Future<Either<Failure, List<IraAgent>>> getAgents();
  Future<Either<Failure, String>> getWelcomeMessage(String agentName);
  Future<Either<Failure, List<IraConversation>>> getChatHistory(String agentId);
  Future<Either<Failure, List<IraFile>>> getFiles(String agentId);
  Future<Either<Failure, IraMessage>> sendMessage(String agentId, String text, {String? chatId, String? userEmail});
  Future<Either<Failure, WelcomeSuggestions>> getWelcomeSuggestions(String assistantId, String assistantName);
  Future<Either<Failure, List<IraMessage>>> getConversationMessages(String conversationId);
}
