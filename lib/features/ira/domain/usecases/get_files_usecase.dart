import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ira_file.dart';
import '../repositories/ira_repository.dart';

@injectable
class GetFilesUseCase implements UseCase<List<IraFile>, String> {
  final IraRepository _repository;

  GetFilesUseCase(this._repository);

  @override
  Future<Either<Failure, List<IraFile>>> call(String agentId) {
    return _repository.getFiles(agentId);
  }
}
