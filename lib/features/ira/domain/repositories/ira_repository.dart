import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/ira_agent.dart';
import '../entities/ira_message.dart';
import '../entities/ira_file.dart';
import '../entities/welcome_suggestions.dart';

abstract class IraRepository {
  Future<Either<Failure, List<IraAgent>>> getAgents();
  Future<Either<Failure, String>> getWelcomeMessage(String agentName);
  Future<Either<Failure, List<IraMessage>>> getChatHistory(String agentId);
  Future<Either<Failure, List<IraFile>>> getFiles(String agentId);
  Future<Either<Failure, IraMessage>> sendMessage(String agentId, String text);
  Future<Either<Failure, WelcomeSuggestions>> getWelcomeSuggestions(String assistantId, String assistantName);
}
