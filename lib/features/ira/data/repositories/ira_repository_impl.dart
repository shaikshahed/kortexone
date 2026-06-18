import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/ira_agent.dart';
import '../../domain/entities/ira_file.dart';
import '../../domain/entities/ira_message.dart';
import '../../domain/entities/welcome_suggestions.dart';
import '../../domain/entities/ira_conversation.dart';
import '../../domain/repositories/ira_repository.dart';
import '../datasources/ira_remote_datasource.dart';
import '../models/welcome_suggestions_request_model.dart';
import '../models/ira_chat_response_model.dart';

@LazySingleton(as: IraRepository)
class IraRepositoryImpl implements IraRepository {
  final IraRemoteDataSource _remoteDataSource;

  IraRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<IraAgent>>> getAgents() async {
    try {
      final models = await _remoteDataSource.getAgents();
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getWelcomeMessage(String agentName) async {
    try {
      final msg = await _remoteDataSource.getWelcomeMessage(agentName);
      return Right(msg);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<IraConversation>>> getChatHistory(String agentId) async {
    try {
      final models = await _remoteDataSource.getChatHistory(agentId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<IraFile>>> getFiles(String agentId) async {
    try {
      final models = await _remoteDataSource.getFiles(agentId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, IraMessage>> sendMessage(
    String agentId,
    String text, {
    String? chatId,
    String? userEmail,
  }) async {
    try {
      final model = await _remoteDataSource.sendMessage(
        agentId,
        text,
        chatId: chatId,
        userEmail: userEmail,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WelcomeSuggestions>> getWelcomeSuggestions(String assistantId, String assistantName) async {
    try {
      final model = await _remoteDataSource.getWelcomeSuggestions(
        WelcomeSuggestionsRequestModel(
          assistantId: assistantId,
          assistantName: assistantName,
        ),
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<IraMessage>>> getConversationMessages(String conversationId) async {
    try {
      final models = await _remoteDataSource.getConversationMessages(conversationId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
