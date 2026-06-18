import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}

class OtpStarted extends OtpEvent {
  const OtpStarted();
}

class OtpTimerTicked extends OtpEvent {
  final int duration;

  const OtpTimerTicked(this.duration);

  @override
  List<Object?> get props => [duration];
}

class OtpCodeChanged extends OtpEvent {
  final String otpCode;

  const OtpCodeChanged(this.otpCode);

  @override
  List<Object?> get props => [otpCode];
}

class OtpSubmitted extends OtpEvent {
  final String email;
  final String password;
  final String otp;

  const OtpSubmitted({
    required this.email,
    required this.password,
    required this.otp,
  });

  @override
  List<Object?> get props => [email, password, otp];
}

class OtpResendRequested extends OtpEvent {
  final String email;
  final String password;

  const OtpResendRequested({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
