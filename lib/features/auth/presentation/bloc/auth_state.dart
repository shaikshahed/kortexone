import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthOtpRequired extends AuthState {
  final String email;
  final String password;
  final String maskedEmail;

  const AuthOtpRequired({
    required this.email,
    required this.password,
    required this.maskedEmail,
  });

  @override
  List<Object?> get props => [email, password, maskedEmail];
}
