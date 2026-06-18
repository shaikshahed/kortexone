// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ira_messages_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IraMessageItemModel {

 String get id; String get role; String get content;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of IraMessageItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IraMessageItemModelCopyWith<IraMessageItemModel> get copyWith => _$IraMessageItemModelCopyWithImpl<IraMessageItemModel>(this as IraMessageItemModel, _$identity);

  /// Serializes this IraMessageItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IraMessageItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,content,createdAt);

@override
String toString() {
  return 'IraMessageItemModel(id: $id, role: $role, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $IraMessageItemModelCopyWith<$Res>  {
  factory $IraMessageItemModelCopyWith(IraMessageItemModel value, $Res Function(IraMessageItemModel) _then) = _$IraMessageItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String role, String content,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$IraMessageItemModelCopyWithImpl<$Res>
    implements $IraMessageItemModelCopyWith<$Res> {
  _$IraMessageItemModelCopyWithImpl(this._self, this._then);

  final IraMessageItemModel _self;
  final $Res Function(IraMessageItemModel) _then;

/// Create a copy of IraMessageItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IraMessageItemModel].
extension IraMessageItemModelPatterns on IraMessageItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IraMessageItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IraMessageItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IraMessageItemModel value)  $default,){
final _that = this;
switch (_that) {
case _IraMessageItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IraMessageItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _IraMessageItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String role,  String content, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IraMessageItemModel() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String role,  String content, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _IraMessageItemModel():
return $default(_that.id,_that.role,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String role,  String content, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _IraMessageItemModel() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IraMessageItemModel extends IraMessageItemModel {
  const _IraMessageItemModel({required this.id, required this.role, required this.content, @JsonKey(name: 'created_at') required this.createdAt}): super._();
  factory _IraMessageItemModel.fromJson(Map<String, dynamic> json) => _$IraMessageItemModelFromJson(json);

@override final  String id;
@override final  String role;
@override final  String content;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of IraMessageItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IraMessageItemModelCopyWith<_IraMessageItemModel> get copyWith => __$IraMessageItemModelCopyWithImpl<_IraMessageItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IraMessageItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IraMessageItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,content,createdAt);

@override
String toString() {
  return 'IraMessageItemModel(id: $id, role: $role, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$IraMessageItemModelCopyWith<$Res> implements $IraMessageItemModelCopyWith<$Res> {
  factory _$IraMessageItemModelCopyWith(_IraMessageItemModel value, $Res Function(_IraMessageItemModel) _then) = __$IraMessageItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String role, String content,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$IraMessageItemModelCopyWithImpl<$Res>
    implements _$IraMessageItemModelCopyWith<$Res> {
  __$IraMessageItemModelCopyWithImpl(this._self, this._then);

  final _IraMessageItemModel _self;
  final $Res Function(_IraMessageItemModel) _then;

/// Create a copy of IraMessageItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_IraMessageItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$IraMessagesResponseModel {

 List<IraMessageItemModel> get messages;
/// Create a copy of IraMessagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IraMessagesResponseModelCopyWith<IraMessagesResponseModel> get copyWith => _$IraMessagesResponseModelCopyWithImpl<IraMessagesResponseModel>(this as IraMessagesResponseModel, _$identity);

  /// Serializes this IraMessagesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IraMessagesResponseModel&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'IraMessagesResponseModel(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $IraMessagesResponseModelCopyWith<$Res>  {
  factory $IraMessagesResponseModelCopyWith(IraMessagesResponseModel value, $Res Function(IraMessagesResponseModel) _then) = _$IraMessagesResponseModelCopyWithImpl;
@useResult
$Res call({
 List<IraMessageItemModel> messages
});




}
/// @nodoc
class _$IraMessagesResponseModelCopyWithImpl<$Res>
    implements $IraMessagesResponseModelCopyWith<$Res> {
  _$IraMessagesResponseModelCopyWithImpl(this._self, this._then);

  final IraMessagesResponseModel _self;
  final $Res Function(IraMessagesResponseModel) _then;

/// Create a copy of IraMessagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<IraMessageItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [IraMessagesResponseModel].
extension IraMessagesResponseModelPatterns on IraMessagesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IraMessagesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IraMessagesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IraMessagesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _IraMessagesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IraMessagesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _IraMessagesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IraMessageItemModel> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IraMessagesResponseModel() when $default != null:
return $default(_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IraMessageItemModel> messages)  $default,) {final _that = this;
switch (_that) {
case _IraMessagesResponseModel():
return $default(_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IraMessageItemModel> messages)?  $default,) {final _that = this;
switch (_that) {
case _IraMessagesResponseModel() when $default != null:
return $default(_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IraMessagesResponseModel implements IraMessagesResponseModel {
  const _IraMessagesResponseModel({required final  List<IraMessageItemModel> messages}): _messages = messages;
  factory _IraMessagesResponseModel.fromJson(Map<String, dynamic> json) => _$IraMessagesResponseModelFromJson(json);

 final  List<IraMessageItemModel> _messages;
@override List<IraMessageItemModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of IraMessagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IraMessagesResponseModelCopyWith<_IraMessagesResponseModel> get copyWith => __$IraMessagesResponseModelCopyWithImpl<_IraMessagesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IraMessagesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IraMessagesResponseModel&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'IraMessagesResponseModel(messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$IraMessagesResponseModelCopyWith<$Res> implements $IraMessagesResponseModelCopyWith<$Res> {
  factory _$IraMessagesResponseModelCopyWith(_IraMessagesResponseModel value, $Res Function(_IraMessagesResponseModel) _then) = __$IraMessagesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<IraMessageItemModel> messages
});




}
/// @nodoc
class __$IraMessagesResponseModelCopyWithImpl<$Res>
    implements _$IraMessagesResponseModelCopyWith<$Res> {
  __$IraMessagesResponseModelCopyWithImpl(this._self, this._then);

  final _IraMessagesResponseModel _self;
  final $Res Function(_IraMessagesResponseModel) _then;

/// Create a copy of IraMessagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(_IraMessagesResponseModel(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<IraMessageItemModel>,
  ));
}


}

// dart format on
