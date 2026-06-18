import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class VerifyOtpUseCase implements UseCase<User, VerifyOtpParams> {
  final AuthRepository _repository;

  VerifyOtpUseCase(this._repository);

  @override
  Future<Either<Failure, User>> call(VerifyOtpParams params) async {
    return await _repository.verifyOtp(
      email: params.email,
      password: params.password,
      otp: params.otp,
    );
  }
}

class VerifyOtpParams extends Equatable {
  final String email;
  final String password;
  final String otp;

  const VerifyOtpParams({
    required this.email,
    required this.password,
    required this.otp,
  });

  @override
  List<Object?> get props => [email, password, otp];
}
