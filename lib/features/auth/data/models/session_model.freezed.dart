// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionModel {

 String get user; String get name; String get role; String get department; List<String> get permissions;@JsonKey(name: 'is_platform_admin') bool get isPlatformAdmin;@JsonKey(name: 'user_id') String get userId; String get tenant;@JsonKey(name: 'tenant_name') String get tenantName;@JsonKey(name: 'jwt_token') String? get jwtToken;
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionModelCopyWith<SessionModel> get copyWith => _$SessionModelCopyWithImpl<SessionModel>(this as SessionModel, _$identity);

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionModel&&(identical(other.user, user) || other.user == user)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.department, department) || other.department == department)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.isPlatformAdmin, isPlatformAdmin) || other.isPlatformAdmin == isPlatformAdmin)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.jwtToken, jwtToken) || other.jwtToken == jwtToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,name,role,department,const DeepCollectionEquality().hash(permissions),isPlatformAdmin,userId,tenant,tenantName,jwtToken);

@override
String toString() {
  return 'SessionModel(user: $user, name: $name, role: $role, department: $department, permissions: $permissions, isPlatformAdmin: $isPlatformAdmin, userId: $userId, tenant: $tenant, tenantName: $tenantName, jwtToken: $jwtToken)';
}


}

/// @nodoc
abstract mixin class $SessionModelCopyWith<$Res>  {
  factory $SessionModelCopyWith(SessionModel value, $Res Function(SessionModel) _then) = _$SessionModelCopyWithImpl;
@useResult
$Res call({
 String user, String name, String role, String department, List<String> permissions,@JsonKey(name: 'is_platform_admin') bool isPlatformAdmin,@JsonKey(name: 'user_id') String userId, String tenant,@JsonKey(name: 'tenant_name') String tenantName,@JsonKey(name: 'jwt_token') String? jwtToken
});




}
/// @nodoc
class _$SessionModelCopyWithImpl<$Res>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._self, this._then);

  final SessionModel _self;
  final $Res Function(SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? name = null,Object? role = null,Object? department = null,Object? permissions = null,Object? isPlatformAdmin = null,Object? userId = null,Object? tenant = null,Object? tenantName = null,Object? jwtToken = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,isPlatformAdmin: null == isPlatformAdmin ? _self.isPlatformAdmin : isPlatformAdmin // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as String,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,jwtToken: freezed == jwtToken ? _self.jwtToken : jwtToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionModel].
extension SessionModelPatterns on SessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String user,  String name,  String role,  String department,  List<String> permissions, @JsonKey(name: 'is_platform_admin')  bool isPlatformAdmin, @JsonKey(name: 'user_id')  String userId,  String tenant, @JsonKey(name: 'tenant_name')  String tenantName, @JsonKey(name: 'jwt_token')  String? jwtToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.user,_that.name,_that.role,_that.department,_that.permissions,_that.isPlatformAdmin,_that.userId,_that.tenant,_that.tenantName,_that.jwtToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String user,  String name,  String role,  String department,  List<String> permissions, @JsonKey(name: 'is_platform_admin')  bool isPlatformAdmin, @JsonKey(name: 'user_id')  String userId,  String tenant, @JsonKey(name: 'tenant_name')  String tenantName, @JsonKey(name: 'jwt_token')  String? jwtToken)  $default,) {final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that.user,_that.name,_that.role,_that.department,_that.permissions,_that.isPlatformAdmin,_that.userId,_that.tenant,_that.tenantName,_that.jwtToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String user,  String name,  String role,  String department,  List<String> permissions, @JsonKey(name: 'is_platform_admin')  bool isPlatformAdmin, @JsonKey(name: 'user_id')  String userId,  String tenant, @JsonKey(name: 'tenant_name')  String tenantName, @JsonKey(name: 'jwt_token')  String? jwtToken)?  $default,) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.user,_that.name,_that.role,_that.department,_that.permissions,_that.isPlatformAdmin,_that.userId,_that.tenant,_that.tenantName,_that.jwtToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionModel extends SessionModel {
  const _SessionModel({required this.user, required this.name, required this.role, required this.department, required final  List<String> permissions, @JsonKey(name: 'is_platform_admin') required this.isPlatformAdmin, @JsonKey(name: 'user_id') required this.userId, required this.tenant, @JsonKey(name: 'tenant_name') required this.tenantName, @JsonKey(name: 'jwt_token') this.jwtToken}): _permissions = permissions,super._();
  factory _SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

@override final  String user;
@override final  String name;
@override final  String role;
@override final  String department;
 final  List<String> _permissions;
@override List<String> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

@override@JsonKey(name: 'is_platform_admin') final  bool isPlatformAdmin;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String tenant;
@override@JsonKey(name: 'tenant_name') final  String tenantName;
@override@JsonKey(name: 'jwt_token') final  String? jwtToken;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionModelCopyWith<_SessionModel> get copyWith => __$SessionModelCopyWithImpl<_SessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionModel&&(identical(other.user, user) || other.user == user)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.department, department) || other.department == department)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.isPlatformAdmin, isPlatformAdmin) || other.isPlatformAdmin == isPlatformAdmin)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.jwtToken, jwtToken) || other.jwtToken == jwtToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,name,role,department,const DeepCollectionEquality().hash(_permissions),isPlatformAdmin,userId,tenant,tenantName,jwtToken);

@override
String toString() {
  return 'SessionModel(user: $user, name: $name, role: $role, department: $department, permissions: $permissions, isPlatformAdmin: $isPlatformAdmin, userId: $userId, tenant: $tenant, tenantName: $tenantName, jwtToken: $jwtToken)';
}


}

/// @nodoc
abstract mixin class _$SessionModelCopyWith<$Res> implements $SessionModelCopyWith<$Res> {
  factory _$SessionModelCopyWith(_SessionModel value, $Res Function(_SessionModel) _then) = __$SessionModelCopyWithImpl;
@override @useResult
$Res call({
 String user, String name, String role, String department, List<String> permissions,@JsonKey(name: 'is_platform_admin') bool isPlatformAdmin,@JsonKey(name: 'user_id') String userId, String tenant,@JsonKey(name: 'tenant_name') String tenantName,@JsonKey(name: 'jwt_token') String? jwtToken
});




}
/// @nodoc
class __$SessionModelCopyWithImpl<$Res>
    implements _$SessionModelCopyWith<$Res> {
  __$SessionModelCopyWithImpl(this._self, this._then);

  final _SessionModel _self;
  final $Res Function(_SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? name = null,Object? role = null,Object? department = null,Object? permissions = null,Object? isPlatformAdmin = null,Object? userId = null,Object? tenant = null,Object? tenantName = null,Object? jwtToken = freezed,}) {
  return _then(_SessionModel(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,isPlatformAdmin: null == isPlatformAdmin ? _self.isPlatformAdmin : isPlatformAdmin // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as String,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,jwtToken: freezed == jwtToken ? _self.jwtToken : jwtToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
