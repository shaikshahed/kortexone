// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ira_chat_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IraChatModel {

 String get id; String get title;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'assistant_id') String get assistantId;
/// Create a copy of IraChatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IraChatModelCopyWith<IraChatModel> get copyWith => _$IraChatModelCopyWithImpl<IraChatModel>(this as IraChatModel, _$identity);

  /// Serializes this IraChatModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IraChatModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.assistantId, assistantId) || other.assistantId == assistantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,assistantId);

@override
String toString() {
  return 'IraChatModel(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, assistantId: $assistantId)';
}


}

/// @nodoc
abstract mixin class $IraChatModelCopyWith<$Res>  {
  factory $IraChatModelCopyWith(IraChatModel value, $Res Function(IraChatModel) _then) = _$IraChatModelCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'assistant_id') String assistantId
});




}
/// @nodoc
class _$IraChatModelCopyWithImpl<$Res>
    implements $IraChatModelCopyWith<$Res> {
  _$IraChatModelCopyWithImpl(this._self, this._then);

  final IraChatModel _self;
  final $Res Function(IraChatModel) _then;

/// Create a copy of IraChatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? assistantId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,assistantId: null == assistantId ? _self.assistantId : assistantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IraChatModel].
extension IraChatModelPatterns on IraChatModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IraChatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IraChatModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IraChatModel value)  $default,){
final _that = this;
switch (_that) {
case _IraChatModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IraChatModel value)?  $default,){
final _that = this;
switch (_that) {
case _IraChatModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'assistant_id')  String assistantId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IraChatModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.assistantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'assistant_id')  String assistantId)  $default,) {final _that = this;
switch (_that) {
case _IraChatModel():
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.assistantId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'assistant_id')  String assistantId)?  $default,) {final _that = this;
switch (_that) {
case _IraChatModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.assistantId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IraChatModel implements IraChatModel {
  const _IraChatModel({required this.id, required this.title, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'assistant_id') required this.assistantId});
  factory _IraChatModel.fromJson(Map<String, dynamic> json) => _$IraChatModelFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'assistant_id') final  String assistantId;

/// Create a copy of IraChatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IraChatModelCopyWith<_IraChatModel> get copyWith => __$IraChatModelCopyWithImpl<_IraChatModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IraChatModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IraChatModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.assistantId, assistantId) || other.assistantId == assistantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,assistantId);

@override
String toString() {
  return 'IraChatModel(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, assistantId: $assistantId)';
}


}

/// @nodoc
abstract mixin class _$IraChatModelCopyWith<$Res> implements $IraChatModelCopyWith<$Res> {
  factory _$IraChatModelCopyWith(_IraChatModel value, $Res Function(_IraChatModel) _then) = __$IraChatModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'assistant_id') String assistantId
});




}
/// @nodoc
class __$IraChatModelCopyWithImpl<$Res>
    implements _$IraChatModelCopyWith<$Res> {
  __$IraChatModelCopyWithImpl(this._self, this._then);

  final _IraChatModel _self;
  final $Res Function(_IraChatModel) _then;

/// Create a copy of IraChatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? assistantId = null,}) {
  return _then(_IraChatModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,assistantId: null == assistantId ? _self.assistantId : assistantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$IraChatResponseModel {

 List<IraChatModel> get chats;
/// Create a copy of IraChatResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IraChatResponseModelCopyWith<IraChatResponseModel> get copyWith => _$IraChatResponseModelCopyWithImpl<IraChatResponseModel>(this as IraChatResponseModel, _$identity);

  /// Serializes this IraChatResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IraChatResponseModel&&const DeepCollectionEquality().equals(other.chats, chats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chats));

@override
String toString() {
  return 'IraChatResponseModel(chats: $chats)';
}


}

/// @nodoc
abstract mixin class $IraChatResponseModelCopyWith<$Res>  {
  factory $IraChatResponseModelCopyWith(IraChatResponseModel value, $Res Function(IraChatResponseModel) _then) = _$IraChatResponseModelCopyWithImpl;
@useResult
$Res call({
 List<IraChatModel> chats
});




}
/// @nodoc
class _$IraChatResponseModelCopyWithImpl<$Res>
    implements $IraChatResponseModelCopyWith<$Res> {
  _$IraChatResponseModelCopyWithImpl(this._self, this._then);

  final IraChatResponseModel _self;
  final $Res Function(IraChatResponseModel) _then;

/// Create a copy of IraChatResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chats = null,}) {
  return _then(_self.copyWith(
chats: null == chats ? _self.chats : chats // ignore: cast_nullable_to_non_nullable
as List<IraChatModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [IraChatResponseModel].
extension IraChatResponseModelPatterns on IraChatResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IraChatResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IraChatResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IraChatResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _IraChatResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IraChatResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _IraChatResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IraChatModel> chats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IraChatResponseModel() when $default != null:
return $default(_that.chats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IraChatModel> chats)  $default,) {final _that = this;
switch (_that) {
case _IraChatResponseModel():
return $default(_that.chats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IraChatModel> chats)?  $default,) {final _that = this;
switch (_that) {
case _IraChatResponseModel() when $default != null:
return $default(_that.chats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IraChatResponseModel implements IraChatResponseModel {
  const _IraChatResponseModel({required final  List<IraChatModel> chats}): _chats = chats;
  factory _IraChatResponseModel.fromJson(Map<String, dynamic> json) => _$IraChatResponseModelFromJson(json);

 final  List<IraChatModel> _chats;
@override List<IraChatModel> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}


/// Create a copy of IraChatResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IraChatResponseModelCopyWith<_IraChatResponseModel> get copyWith => __$IraChatResponseModelCopyWithImpl<_IraChatResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IraChatResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IraChatResponseModel&&const DeepCollectionEquality().equals(other._chats, _chats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats));

@override
String toString() {
  return 'IraChatResponseModel(chats: $chats)';
}


}

/// @nodoc
abstract mixin class _$IraChatResponseModelCopyWith<$Res> implements $IraChatResponseModelCopyWith<$Res> {
  factory _$IraChatResponseModelCopyWith(_IraChatResponseModel value, $Res Function(_IraChatResponseModel) _then) = __$IraChatResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<IraChatModel> chats
});




}
/// @nodoc
class __$IraChatResponseModelCopyWithImpl<$Res>
    implements _$IraChatResponseModelCopyWith<$Res> {
  __$IraChatResponseModelCopyWithImpl(this._self, this._then);

  final _IraChatResponseModel _self;
  final $Res Function(_IraChatResponseModel) _then;

/// Create a copy of IraChatResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chats = null,}) {
  return _then(_IraChatResponseModel(
chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<IraChatModel>,
  ));
}


}

// dart format on
