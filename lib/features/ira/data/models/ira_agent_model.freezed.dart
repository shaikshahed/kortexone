// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ira_agent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IraAgentModel {

 String get id; String get name; String get description; String get status; String get iconPath;
/// Create a copy of IraAgentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IraAgentModelCopyWith<IraAgentModel> get copyWith => _$IraAgentModelCopyWithImpl<IraAgentModel>(this as IraAgentModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IraAgentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,status,iconPath);

@override
String toString() {
  return 'IraAgentModel(id: $id, name: $name, description: $description, status: $status, iconPath: $iconPath)';
}


}

/// @nodoc
abstract mixin class $IraAgentModelCopyWith<$Res>  {
  factory $IraAgentModelCopyWith(IraAgentModel value, $Res Function(IraAgentModel) _then) = _$IraAgentModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String status, String iconPath
});




}
/// @nodoc
class _$IraAgentModelCopyWithImpl<$Res>
    implements $IraAgentModelCopyWith<$Res> {
  _$IraAgentModelCopyWithImpl(this._self, this._then);

  final IraAgentModel _self;
  final $Res Function(IraAgentModel) _then;

/// Create a copy of IraAgentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? status = null,Object? iconPath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,iconPath: null == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IraAgentModel].
extension IraAgentModelPatterns on IraAgentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IraAgentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IraAgentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IraAgentModel value)  $default,){
final _that = this;
switch (_that) {
case _IraAgentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IraAgentModel value)?  $default,){
final _that = this;
switch (_that) {
case _IraAgentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String status,  String iconPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IraAgentModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status,_that.iconPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String status,  String iconPath)  $default,) {final _that = this;
switch (_that) {
case _IraAgentModel():
return $default(_that.id,_that.name,_that.description,_that.status,_that.iconPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String status,  String iconPath)?  $default,) {final _that = this;
switch (_that) {
case _IraAgentModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status,_that.iconPath);case _:
  return null;

}
}

}

/// @nodoc


class _IraAgentModel extends IraAgentModel {
  const _IraAgentModel({required this.id, required this.name, required this.description, required this.status, required this.iconPath}): super._();
  

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String status;
@override final  String iconPath;

/// Create a copy of IraAgentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IraAgentModelCopyWith<_IraAgentModel> get copyWith => __$IraAgentModelCopyWithImpl<_IraAgentModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IraAgentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,status,iconPath);

@override
String toString() {
  return 'IraAgentModel(id: $id, name: $name, description: $description, status: $status, iconPath: $iconPath)';
}


}

/// @nodoc
abstract mixin class _$IraAgentModelCopyWith<$Res> implements $IraAgentModelCopyWith<$Res> {
  factory _$IraAgentModelCopyWith(_IraAgentModel value, $Res Function(_IraAgentModel) _then) = __$IraAgentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String status, String iconPath
});




}
/// @nodoc
class __$IraAgentModelCopyWithImpl<$Res>
    implements _$IraAgentModelCopyWith<$Res> {
  __$IraAgentModelCopyWithImpl(this._self, this._then);

  final _IraAgentModel _self;
  final $Res Function(_IraAgentModel) _then;

/// Create a copy of IraAgentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? status = null,Object? iconPath = null,}) {
  return _then(_IraAgentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,iconPath: null == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
