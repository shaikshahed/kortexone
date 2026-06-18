// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ira_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IraFileModel {

 String get id; String get agentId; String get name; String get extension; String get sizeString;
/// Create a copy of IraFileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IraFileModelCopyWith<IraFileModel> get copyWith => _$IraFileModelCopyWithImpl<IraFileModel>(this as IraFileModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IraFileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.extension, extension) || other.extension == extension)&&(identical(other.sizeString, sizeString) || other.sizeString == sizeString));
}


@override
int get hashCode => Object.hash(runtimeType,id,agentId,name,extension,sizeString);

@override
String toString() {
  return 'IraFileModel(id: $id, agentId: $agentId, name: $name, extension: $extension, sizeString: $sizeString)';
}


}

/// @nodoc
abstract mixin class $IraFileModelCopyWith<$Res>  {
  factory $IraFileModelCopyWith(IraFileModel value, $Res Function(IraFileModel) _then) = _$IraFileModelCopyWithImpl;
@useResult
$Res call({
 String id, String agentId, String name, String extension, String sizeString
});




}
/// @nodoc
class _$IraFileModelCopyWithImpl<$Res>
    implements $IraFileModelCopyWith<$Res> {
  _$IraFileModelCopyWithImpl(this._self, this._then);

  final IraFileModel _self;
  final $Res Function(IraFileModel) _then;

/// Create a copy of IraFileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? agentId = null,Object? name = null,Object? extension = null,Object? sizeString = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,extension: null == extension ? _self.extension : extension // ignore: cast_nullable_to_non_nullable
as String,sizeString: null == sizeString ? _self.sizeString : sizeString // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IraFileModel].
extension IraFileModelPatterns on IraFileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IraFileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IraFileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IraFileModel value)  $default,){
final _that = this;
switch (_that) {
case _IraFileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IraFileModel value)?  $default,){
final _that = this;
switch (_that) {
case _IraFileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String agentId,  String name,  String extension,  String sizeString)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IraFileModel() when $default != null:
return $default(_that.id,_that.agentId,_that.name,_that.extension,_that.sizeString);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String agentId,  String name,  String extension,  String sizeString)  $default,) {final _that = this;
switch (_that) {
case _IraFileModel():
return $default(_that.id,_that.agentId,_that.name,_that.extension,_that.sizeString);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String agentId,  String name,  String extension,  String sizeString)?  $default,) {final _that = this;
switch (_that) {
case _IraFileModel() when $default != null:
return $default(_that.id,_that.agentId,_that.name,_that.extension,_that.sizeString);case _:
  return null;

}
}

}

/// @nodoc


class _IraFileModel extends IraFileModel {
  const _IraFileModel({required this.id, required this.agentId, required this.name, required this.extension, required this.sizeString}): super._();
  

@override final  String id;
@override final  String agentId;
@override final  String name;
@override final  String extension;
@override final  String sizeString;

/// Create a copy of IraFileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IraFileModelCopyWith<_IraFileModel> get copyWith => __$IraFileModelCopyWithImpl<_IraFileModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IraFileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.extension, extension) || other.extension == extension)&&(identical(other.sizeString, sizeString) || other.sizeString == sizeString));
}


@override
int get hashCode => Object.hash(runtimeType,id,agentId,name,extension,sizeString);

@override
String toString() {
  return 'IraFileModel(id: $id, agentId: $agentId, name: $name, extension: $extension, sizeString: $sizeString)';
}


}

/// @nodoc
abstract mixin class _$IraFileModelCopyWith<$Res> implements $IraFileModelCopyWith<$Res> {
  factory _$IraFileModelCopyWith(_IraFileModel value, $Res Function(_IraFileModel) _then) = __$IraFileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String agentId, String name, String extension, String sizeString
});




}
/// @nodoc
class __$IraFileModelCopyWithImpl<$Res>
    implements _$IraFileModelCopyWith<$Res> {
  __$IraFileModelCopyWithImpl(this._self, this._then);

  final _IraFileModel _self;
  final $Res Function(_IraFileModel) _then;

/// Create a copy of IraFileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? agentId = null,Object? name = null,Object? extension = null,Object? sizeString = null,}) {
  return _then(_IraFileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,extension: null == extension ? _self.extension : extension // ignore: cast_nullable_to_non_nullable
as String,sizeString: null == sizeString ? _self.sizeString : sizeString // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
