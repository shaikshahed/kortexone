import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ira_agent.dart';
import '../repositories/ira_repository.dart';

@injectable
class GetAgentsUseCase implements UseCase<List<IraAgent>, NoParams> {
  final IraRepository _repository;

  GetAgentsUseCase(this._repository);

  @override
  Future<Either<Failure, List<IraAgent>>> call(NoParams params) {
    return _repository.getAgents();
  }
}
