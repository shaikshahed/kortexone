import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class ResendOtpUseCase implements UseCase<void, ResendOtpParams> {
  final AuthRepository _repository;

  ResendOtpUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ResendOtpParams params) async {
    return await _repository.resendOtp(
      email: params.email,
      password: params.password,
    );
  }
}

class ResendOtpParams extends Equatable {
  final String email;
  final String password;

  const ResendOtpParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
