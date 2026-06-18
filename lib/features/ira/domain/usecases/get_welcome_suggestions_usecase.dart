import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/welcome_suggestions.dart';
import '../repositories/ira_repository.dart';

class WelcomeSuggestionsParams extends Equatable {
  final String assistantId;
  final String assistantName;

  const WelcomeSuggestionsParams({
    required this.assistantId,
    required this.assistantName,
  });

  @override
  List<Object?> get props => [assistantId, assistantName];
}

@injectable
class GetWelcomeSuggestionsUseCase implements UseCase<WelcomeSuggestions, WelcomeSuggestionsParams> {
  final IraRepository _repository;

  GetWelcomeSuggestionsUseCase(this._repository);

  @override
  Future<Either<Failure, WelcomeSuggestions>> call(WelcomeSuggestionsParams params) {
    return _repository.getWelcomeSuggestions(params.assistantId, params.assistantName);
  }
}
