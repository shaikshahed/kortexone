// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponse {

 bool get success;@JsonKey(name: 'requires_2fa') bool? get requires2fa;@JsonKey(name: 'email_sent') bool? get emailSent;@JsonKey(name: 'masked_email') String? get maskedEmail; String? get message; SessionModel? get session; String get accessToken; String get refreshToken;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.requires2fa, requires2fa) || other.requires2fa == requires2fa)&&(identical(other.emailSent, emailSent) || other.emailSent == emailSent)&&(identical(other.maskedEmail, maskedEmail) || other.maskedEmail == maskedEmail)&&(identical(other.message, message) || other.message == message)&&(identical(other.session, session) || other.session == session)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,requires2fa,emailSent,maskedEmail,message,session,accessToken,refreshToken);

@override
String toString() {
  return 'LoginResponse(success: $success, requires2fa: $requires2fa, emailSent: $emailSent, maskedEmail: $maskedEmail, message: $message, session: $session, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 bool success,@JsonKey(name: 'requires_2fa') bool? requires2fa,@JsonKey(name: 'email_sent') bool? emailSent,@JsonKey(name: 'masked_email') String? maskedEmail, String? message, SessionModel? session, String accessToken, String refreshToken
});


$SessionModelCopyWith<$Res>? get session;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? requires2fa = freezed,Object? emailSent = freezed,Object? maskedEmail = freezed,Object? message = freezed,Object? session = freezed,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,requires2fa: freezed == requires2fa ? _self.requires2fa : requires2fa // ignore: cast_nullable_to_non_nullable
as bool?,emailSent: freezed == emailSent ? _self.emailSent : emailSent // ignore: cast_nullable_to_non_nullable
as bool?,maskedEmail: freezed == maskedEmail ? _self.maskedEmail : maskedEmail // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionModel?,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionModelCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $SessionModelCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'requires_2fa')  bool? requires2fa, @JsonKey(name: 'email_sent')  bool? emailSent, @JsonKey(name: 'masked_email')  String? maskedEmail,  String? message,  SessionModel? session,  String accessToken,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.success,_that.requires2fa,_that.emailSent,_that.maskedEmail,_that.message,_that.session,_that.accessToken,_that.refreshToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'requires_2fa')  bool? requires2fa, @JsonKey(name: 'email_sent')  bool? emailSent, @JsonKey(name: 'masked_email')  String? maskedEmail,  String? message,  SessionModel? session,  String accessToken,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that.success,_that.requires2fa,_that.emailSent,_that.maskedEmail,_that.message,_that.session,_that.accessToken,_that.refreshToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success, @JsonKey(name: 'requires_2fa')  bool? requires2fa, @JsonKey(name: 'email_sent')  bool? emailSent, @JsonKey(name: 'masked_email')  String? maskedEmail,  String? message,  SessionModel? session,  String accessToken,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.success,_that.requires2fa,_that.emailSent,_that.maskedEmail,_that.message,_that.session,_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({required this.success, @JsonKey(name: 'requires_2fa') this.requires2fa, @JsonKey(name: 'email_sent') this.emailSent, @JsonKey(name: 'masked_email') this.maskedEmail, this.message, this.session, this.accessToken = '', this.refreshToken = ''});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  bool success;
@override@JsonKey(name: 'requires_2fa') final  bool? requires2fa;
@override@JsonKey(name: 'email_sent') final  bool? emailSent;
@override@JsonKey(name: 'masked_email') final  String? maskedEmail;
@override final  String? message;
@override final  SessionModel? session;
@override@JsonKey() final  String accessToken;
@override@JsonKey() final  String refreshToken;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.requires2fa, requires2fa) || other.requires2fa == requires2fa)&&(identical(other.emailSent, emailSent) || other.emailSent == emailSent)&&(identical(other.maskedEmail, maskedEmail) || other.maskedEmail == maskedEmail)&&(identical(other.message, message) || other.message == message)&&(identical(other.session, session) || other.session == session)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,requires2fa,emailSent,maskedEmail,message,session,accessToken,refreshToken);

@override
String toString() {
  return 'LoginResponse(success: $success, requires2fa: $requires2fa, emailSent: $emailSent, maskedEmail: $maskedEmail, message: $message, session: $session, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success,@JsonKey(name: 'requires_2fa') bool? requires2fa,@JsonKey(name: 'email_sent') bool? emailSent,@JsonKey(name: 'masked_email') String? maskedEmail, String? message, SessionModel? session, String accessToken, String refreshToken
});


@override $SessionModelCopyWith<$Res>? get session;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? requires2fa = freezed,Object? emailSent = freezed,Object? maskedEmail = freezed,Object? message = freezed,Object? session = freezed,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_LoginResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,requires2fa: freezed == requires2fa ? _self.requires2fa : requires2fa // ignore: cast_nullable_to_non_nullable
as bool?,emailSent: freezed == emailSent ? _self.emailSent : emailSent // ignore: cast_nullable_to_non_nullable
as bool?,maskedEmail: freezed == maskedEmail ? _self.maskedEmail : maskedEmail // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionModel?,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionModelCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $SessionModelCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
