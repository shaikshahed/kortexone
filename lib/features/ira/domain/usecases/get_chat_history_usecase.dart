import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ira_message.dart';
import '../repositories/ira_repository.dart';

@injectable
class GetChatHistoryUseCase implements UseCase<List<IraMessage>, String> {
  final IraRepository _repository;

  GetChatHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<IraMessage>>> call(String agentId) {
    return _repository.getChatHistory(agentId);
  }
}
