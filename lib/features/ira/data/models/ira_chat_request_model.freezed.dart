// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ira_chat_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IraChatRequestModel {

 String get message;@JsonKey(name: 'user_email') String get userEmail; String get model; bool get stream;@JsonKey(name: 'frappe_state') String? get frappeState;@JsonKey(name: 'agent_type') String get agentType;@JsonKey(name: 'assistant_id') String get assistantId;@JsonKey(name: 'chat_id') String? get chatId;
/// Create a copy of IraChatRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IraChatRequestModelCopyWith<IraChatRequestModel> get copyWith => _$IraChatRequestModelCopyWithImpl<IraChatRequestModel>(this as IraChatRequestModel, _$identity);

  /// Serializes this IraChatRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IraChatRequestModel&&(identical(other.message, message) || other.message == message)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.model, model) || other.model == model)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.frappeState, frappeState) || other.frappeState == frappeState)&&(identical(other.agentType, agentType) || other.agentType == agentType)&&(identical(other.assistantId, assistantId) || other.assistantId == assistantId)&&(identical(other.chatId, chatId) || other.chatId == chatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,userEmail,model,stream,frappeState,agentType,assistantId,chatId);

@override
String toString() {
  return 'IraChatRequestModel(message: $message, userEmail: $userEmail, model: $model, stream: $stream, frappeState: $frappeState, agentType: $agentType, assistantId: $assistantId, chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class $IraChatRequestModelCopyWith<$Res>  {
  factory $IraChatRequestModelCopyWith(IraChatRequestModel value, $Res Function(IraChatRequestModel) _then) = _$IraChatRequestModelCopyWithImpl;
@useResult
$Res call({
 String message,@JsonKey(name: 'user_email') String userEmail, String model, bool stream,@JsonKey(name: 'frappe_state') String? frappeState,@JsonKey(name: 'agent_type') String agentType,@JsonKey(name: 'assistant_id') String assistantId,@JsonKey(name: 'chat_id') String? chatId
});




}
/// @nodoc
class _$IraChatRequestModelCopyWithImpl<$Res>
    implements $IraChatRequestModelCopyWith<$Res> {
  _$IraChatRequestModelCopyWithImpl(this._self, this._then);

  final IraChatRequestModel _self;
  final $Res Function(IraChatRequestModel) _then;

/// Create a copy of IraChatRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? userEmail = null,Object? model = null,Object? stream = null,Object? frappeState = freezed,Object? agentType = null,Object? assistantId = null,Object? chatId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,userEmail: null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,frappeState: freezed == frappeState ? _self.frappeState : frappeState // ignore: cast_nullable_to_non_nullable
as String?,agentType: null == agentType ? _self.agentType : agentType // ignore: cast_nullable_to_non_nullable
as String,assistantId: null == assistantId ? _self.assistantId : assistantId // ignore: cast_nullable_to_non_nullable
as String,chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IraChatRequestModel].
extension IraChatRequestModelPatterns on IraChatRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IraChatRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IraChatRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IraChatRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _IraChatRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IraChatRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _IraChatRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'user_email')  String userEmail,  String model,  bool stream, @JsonKey(name: 'frappe_state')  String? frappeState, @JsonKey(name: 'agent_type')  String agentType, @JsonKey(name: 'assistant_id')  String assistantId, @JsonKey(name: 'chat_id')  String? chatId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IraChatRequestModel() when $default != null:
return $default(_that.message,_that.userEmail,_that.model,_that.stream,_that.frappeState,_that.agentType,_that.assistantId,_that.chatId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'user_email')  String userEmail,  String model,  bool stream, @JsonKey(name: 'frappe_state')  String? frappeState, @JsonKey(name: 'agent_type')  String agentType, @JsonKey(name: 'assistant_id')  String assistantId, @JsonKey(name: 'chat_id')  String? chatId)  $default,) {final _that = this;
switch (_that) {
case _IraChatRequestModel():
return $default(_that.message,_that.userEmail,_that.model,_that.stream,_that.frappeState,_that.agentType,_that.assistantId,_that.chatId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message, @JsonKey(name: 'user_email')  String userEmail,  String model,  bool stream, @JsonKey(name: 'frappe_state')  String? frappeState, @JsonKey(name: 'agent_type')  String agentType, @JsonKey(name: 'assistant_id')  String assistantId, @JsonKey(name: 'chat_id')  String? chatId)?  $default,) {final _that = this;
switch (_that) {
case _IraChatRequestModel() when $default != null:
return $default(_that.message,_that.userEmail,_that.model,_that.stream,_that.frappeState,_that.agentType,_that.assistantId,_that.chatId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IraChatRequestModel implements IraChatRequestModel {
  const _IraChatRequestModel({required this.message, @JsonKey(name: 'user_email') required this.userEmail, this.model = 'gemini-2.5-flash', this.stream = true, @JsonKey(name: 'frappe_state') this.frappeState, @JsonKey(name: 'agent_type') this.agentType = 'zoho', @JsonKey(name: 'assistant_id') required this.assistantId, @JsonKey(name: 'chat_id') this.chatId});
  factory _IraChatRequestModel.fromJson(Map<String, dynamic> json) => _$IraChatRequestModelFromJson(json);

@override final  String message;
@override@JsonKey(name: 'user_email') final  String userEmail;
@override@JsonKey() final  String model;
@override@JsonKey() final  bool stream;
@override@JsonKey(name: 'frappe_state') final  String? frappeState;
@override@JsonKey(name: 'agent_type') final  String agentType;
@override@JsonKey(name: 'assistant_id') final  String assistantId;
@override@JsonKey(name: 'chat_id') final  String? chatId;

/// Create a copy of IraChatRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IraChatRequestModelCopyWith<_IraChatRequestModel> get copyWith => __$IraChatRequestModelCopyWithImpl<_IraChatRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IraChatRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IraChatRequestModel&&(identical(other.message, message) || other.message == message)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.model, model) || other.model == model)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.frappeState, frappeState) || other.frappeState == frappeState)&&(identical(other.agentType, agentType) || other.agentType == agentType)&&(identical(other.assistantId, assistantId) || other.assistantId == assistantId)&&(identical(other.chatId, chatId) || other.chatId == chatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,userEmail,model,stream,frappeState,agentType,assistantId,chatId);

@override
String toString() {
  return 'IraChatRequestModel(message: $message, userEmail: $userEmail, model: $model, stream: $stream, frappeState: $frappeState, agentType: $agentType, assistantId: $assistantId, chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class _$IraChatRequestModelCopyWith<$Res> implements $IraChatRequestModelCopyWith<$Res> {
  factory _$IraChatRequestModelCopyWith(_IraChatRequestModel value, $Res Function(_IraChatRequestModel) _then) = __$IraChatRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String message,@JsonKey(name: 'user_email') String userEmail, String model, bool stream,@JsonKey(name: 'frappe_state') String? frappeState,@JsonKey(name: 'agent_type') String agentType,@JsonKey(name: 'assistant_id') String assistantId,@JsonKey(name: 'chat_id') String? chatId
});




}
/// @nodoc
class __$IraChatRequestModelCopyWithImpl<$Res>
    implements _$IraChatRequestModelCopyWith<$Res> {
  __$IraChatRequestModelCopyWithImpl(this._self, this._then);

  final _IraChatRequestModel _self;
  final $Res Function(_IraChatRequestModel) _then;

/// Create a copy of IraChatRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? userEmail = null,Object? model = null,Object? stream = null,Object? frappeState = freezed,Object? agentType = null,Object? assistantId = null,Object? chatId = freezed,}) {
  return _then(_IraChatRequestModel(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,userEmail: null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,frappeState: freezed == frappeState ? _self.frappeState : frappeState // ignore: cast_nullable_to_non_nullable
as String?,agentType: null == agentType ? _self.agentType : agentType // ignore: cast_nullable_to_non_nullable
as String,assistantId: null == assistantId ? _self.assistantId : assistantId // ignore: cast_nullable_to_non_nullable
as String,chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
