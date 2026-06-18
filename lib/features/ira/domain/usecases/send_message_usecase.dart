import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ira_message.dart';
import '../repositories/ira_repository.dart';

class SendMessageParams {
  final String agentId;
  final String text;

  const SendMessageParams({required this.agentId, required this.text});
}

@injectable
class SendMessageUseCase implements UseCase<IraMessage, SendMessageParams> {
  final IraRepository _repository;

  SendMessageUseCase(this._repository);

  @override
  Future<Either<Failure, IraMessage>> call(SendMessageParams params) {
    return _repository.sendMessage(params.agentId, params.text);
  }
}
