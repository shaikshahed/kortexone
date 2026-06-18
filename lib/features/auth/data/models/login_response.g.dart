// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      success: json['success'] as bool,
      requires2fa: json['requires_2fa'] as bool?,
      emailSent: json['email_sent'] as bool?,
      maskedEmail: json['masked_email'] as String?,
      message: json['message'] as String?,
      session: json['session'] == null
          ? null
          : SessionModel.fromJson(json['session'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'requires_2fa': instance.requires2fa,
      'email_sent': instance.emailSent,
      'masked_email': instance.maskedEmail,
      'message': instance.message,
      'session': instance.session,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
