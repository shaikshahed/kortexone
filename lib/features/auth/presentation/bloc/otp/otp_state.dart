import 'package:equatable/equatable.dart';

enum OtpStatus { initial, loading, success, failure }
enum ResendStatus { initial, loading, success, failure }

class OtpState extends Equatable {
  final String otpCode;
  final int timerSeconds;
  final bool isTimerActive;
  final OtpStatus status;
  final ResendStatus resendStatus;
  final String? errorMessage;

  const OtpState({
    this.otpCode = '',
    this.timerSeconds = 30,
    this.isTimerActive = true,
    this.status = OtpStatus.initial,
    this.resendStatus = ResendStatus.initial,
    this.errorMessage,
  });

  OtpState copyWith({
    String? otpCode,
    int? timerSeconds,
    bool? isTimerActive,
    OtpStatus? status,
    ResendStatus? resendStatus,
    String? errorMessage,
  }) {
    return OtpState(
      otpCode: otpCode ?? this.otpCode,
      timerSeconds: timerSeconds ?? this.timerSeconds,
      isTimerActive: isTimerActive ?? this.isTimerActive,
      status: status ?? this.status,
      resendStatus: resendStatus ?? this.resendStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        otpCode,
        timerSeconds,
        isTimerActive,
        status,
        resendStatus,
        errorMessage,
      ];
}
