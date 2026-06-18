import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/ira_repository.dart';

@injectable
class GetWelcomeMessageUseCase implements UseCase<String, String> {
  final IraRepository _repository;

  GetWelcomeMessageUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(String agentName) {
    return _repository.getWelcomeMessage(agentName);
  }
}
