import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/verify_otp_usecase.dart';
import '../../../domain/usecases/resend_otp_usecase.dart';
import 'otp_event.dart';
import 'otp_state.dart';

@injectable
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final VerifyOtpUseCase _verifyOtpUseCase;
  final ResendOtpUseCase _resendOtpUseCase;
  Timer? _timer;

  OtpBloc(
    this._verifyOtpUseCase,
    this._resendOtpUseCase,
  ) : super(const OtpState()) {
    on<OtpStarted>(_onOtpStarted);
    on<OtpTimerTicked>(_onOtpTimerTicked);
    on<OtpCodeChanged>(_onOtpCodeChanged);
    on<OtpSubmitted>(_onOtpSubmitted);
    on<OtpResendRequested>(_onOtpResendRequested);
  }

  void _onOtpStarted(OtpStarted event, Emitter<OtpState> emit) {
    _startTimer(emit);
  }

  void _onOtpTimerTicked(OtpTimerTicked event, Emitter<OtpState> emit) {
    if (event.duration > 0) {
      emit(state.copyWith(
        timerSeconds: event.duration,
        isTimerActive: true,
        status: OtpStatus.initial,
        resendStatus: ResendStatus.initial,
      ));
    } else {
      _timer?.cancel();
      emit(state.copyWith(
        timerSeconds: 0,
        isTimerActive: false,
        status: OtpStatus.initial,
        resendStatus: ResendStatus.initial,
      ));
    }
  }

  void _onOtpCodeChanged(OtpCodeChanged event, Emitter<OtpState> emit) {
    emit(state.copyWith(
      otpCode: event.otpCode,
      status: OtpStatus.initial,
      resendStatus: ResendStatus.initial,
    ));
  }

  Future<void> _onOtpSubmitted(OtpSubmitted event, Emitter<OtpState> emit) async {
    emit(state.copyWith(
      status: OtpStatus.loading,
      resendStatus: ResendStatus.initial,
      errorMessage: null,
    ));
    final result = await _verifyOtpUseCase(
      VerifyOtpParams(
        email: event.email,
        password: event.password,
        otp: event.otp,
      ),
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: OtpStatus.failure,
        errorMessage: failure.message,
      )),
      (user) => emit(state.copyWith(status: OtpStatus.success)),
    );
  }

  Future<void> _onOtpResendRequested(OtpResendRequested event, Emitter<OtpState> emit) async {
    emit(state.copyWith(
      resendStatus: ResendStatus.loading,
      status: OtpStatus.initial,
      errorMessage: null,
    ));
    final result = await _resendOtpUseCase(
      ResendOtpParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(state.copyWith(
        resendStatus: ResendStatus.failure,
        errorMessage: failure.message,
      )),
      (_) {
        emit(state.copyWith(
          resendStatus: ResendStatus.success,
          timerSeconds: 30,
          isTimerActive: true,
        ));
        _startTimer(null);
      },
    );
  }

  void _startTimer(Emitter<OtpState>? emit) {
    _timer?.cancel();
    int seconds = 30;
    if (emit != null) {
      emit(state.copyWith(
        timerSeconds: seconds,
        isTimerActive: true,
      ));
    } else {
      add(OtpTimerTicked(seconds));
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds--;
      add(OtpTimerTicked(seconds));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
