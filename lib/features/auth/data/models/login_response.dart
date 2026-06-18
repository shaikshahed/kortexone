import 'package:freezed_annotation/freezed_annotation.dart';
import 'session_model.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool success,
    @JsonKey(name: 'requires_2fa') bool? requires2fa,
    @JsonKey(name: 'email_sent') bool? emailSent,
    @JsonKey(name: 'masked_email') String? maskedEmail,
    String? message,
    SessionModel? session,
    @Default('') String accessToken,
    @Default('') String refreshToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
