// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ira_chat_send_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IraChatSendResponseModel {

 String? get answer; String? get response;@JsonKey(name: 'suggested_questions') List<String>? get suggestedQuestions; List<dynamic>? get sources;@JsonKey(name: 'chat_id') String? get chatId;@JsonKey(name: 'session_id') String? get sessionId;@JsonKey(name: 'message_id') String? get messageId;@JsonKey(name: 'model_used') String? get modelUsed;@JsonKey(name: 'provider_name') String? get providerName;@JsonKey(name: 'response_time_ms') double? get responseTimeMs;@JsonKey(name: 'total_time_ms') double? get totalTimeMs; String? get intent;@JsonKey(name: 'data_source') String? get dataSource;@JsonKey(name: 'cached_at') String? get cachedAt;@JsonKey(name: '__metadata__') bool? get metadata;
/// Create a copy of IraChatSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IraChatSendResponseModelCopyWith<IraChatSendResponseModel> get copyWith => _$IraChatSendResponseModelCopyWithImpl<IraChatSendResponseModel>(this as IraChatSendResponseModel, _$identity);

  /// Serializes this IraChatSendResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IraChatSendResponseModel&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.response, response) || other.response == response)&&const DeepCollectionEquality().equals(other.suggestedQuestions, suggestedQuestions)&&const DeepCollectionEquality().equals(other.sources, sources)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.responseTimeMs, responseTimeMs) || other.responseTimeMs == responseTimeMs)&&(identical(other.totalTimeMs, totalTimeMs) || other.totalTimeMs == totalTimeMs)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answer,response,const DeepCollectionEquality().hash(suggestedQuestions),const DeepCollectionEquality().hash(sources),chatId,sessionId,messageId,modelUsed,providerName,responseTimeMs,totalTimeMs,intent,dataSource,cachedAt,metadata);

@override
String toString() {
  return 'IraChatSendResponseModel(answer: $answer, response: $response, suggestedQuestions: $suggestedQuestions, sources: $sources, chatId: $chatId, sessionId: $sessionId, messageId: $messageId, modelUsed: $modelUsed, providerName: $providerName, responseTimeMs: $responseTimeMs, totalTimeMs: $totalTimeMs, intent: $intent, dataSource: $dataSource, cachedAt: $cachedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $IraChatSendResponseModelCopyWith<$Res>  {
  factory $IraChatSendResponseModelCopyWith(IraChatSendResponseModel value, $Res Function(IraChatSendResponseModel) _then) = _$IraChatSendResponseModelCopyWithImpl;
@useResult
$Res call({
 String? answer, String? response,@JsonKey(name: 'suggested_questions') List<String>? suggestedQuestions, List<dynamic>? sources,@JsonKey(name: 'chat_id') String? chatId,@JsonKey(name: 'session_id') String? sessionId,@JsonKey(name: 'message_id') String? messageId,@JsonKey(name: 'model_used') String? modelUsed,@JsonKey(name: 'provider_name') String? providerName,@JsonKey(name: 'response_time_ms') double? responseTimeMs,@JsonKey(name: 'total_time_ms') double? totalTimeMs, String? intent,@JsonKey(name: 'data_source') String? dataSource,@JsonKey(name: 'cached_at') String? cachedAt,@JsonKey(name: '__metadata__') bool? metadata
});




}
/// @nodoc
class _$IraChatSendResponseModelCopyWithImpl<$Res>
    implements $IraChatSendResponseModelCopyWith<$Res> {
  _$IraChatSendResponseModelCopyWithImpl(this._self, this._then);

  final IraChatSendResponseModel _self;
  final $Res Function(IraChatSendResponseModel) _then;

/// Create a copy of IraChatSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? answer = freezed,Object? response = freezed,Object? suggestedQuestions = freezed,Object? sources = freezed,Object? chatId = freezed,Object? sessionId = freezed,Object? messageId = freezed,Object? modelUsed = freezed,Object? providerName = freezed,Object? responseTimeMs = freezed,Object? totalTimeMs = freezed,Object? intent = freezed,Object? dataSource = freezed,Object? cachedAt = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,suggestedQuestions: freezed == suggestedQuestions ? _self.suggestedQuestions : suggestedQuestions // ignore: cast_nullable_to_non_nullable
as List<String>?,sources: freezed == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,modelUsed: freezed == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String?,providerName: freezed == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String?,responseTimeMs: freezed == responseTimeMs ? _self.responseTimeMs : responseTimeMs // ignore: cast_nullable_to_non_nullable
as double?,totalTimeMs: freezed == totalTimeMs ? _self.totalTimeMs : totalTimeMs // ignore: cast_nullable_to_non_nullable
as double?,intent: freezed == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [IraChatSendResponseModel].
extension IraChatSendResponseModelPatterns on IraChatSendResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IraChatSendResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IraChatSendResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IraChatSendResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _IraChatSendResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IraChatSendResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _IraChatSendResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? answer,  String? response, @JsonKey(name: 'suggested_questions')  List<String>? suggestedQuestions,  List<dynamic>? sources, @JsonKey(name: 'chat_id')  String? chatId, @JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'message_id')  String? messageId, @JsonKey(name: 'model_used')  String? modelUsed, @JsonKey(name: 'provider_name')  String? providerName, @JsonKey(name: 'response_time_ms')  double? responseTimeMs, @JsonKey(name: 'total_time_ms')  double? totalTimeMs,  String? intent, @JsonKey(name: 'data_source')  String? dataSource, @JsonKey(name: 'cached_at')  String? cachedAt, @JsonKey(name: '__metadata__')  bool? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IraChatSendResponseModel() when $default != null:
return $default(_that.answer,_that.response,_that.suggestedQuestions,_that.sources,_that.chatId,_that.sessionId,_that.messageId,_that.modelUsed,_that.providerName,_that.responseTimeMs,_that.totalTimeMs,_that.intent,_that.dataSource,_that.cachedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? answer,  String? response, @JsonKey(name: 'suggested_questions')  List<String>? suggestedQuestions,  List<dynamic>? sources, @JsonKey(name: 'chat_id')  String? chatId, @JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'message_id')  String? messageId, @JsonKey(name: 'model_used')  String? modelUsed, @JsonKey(name: 'provider_name')  String? providerName, @JsonKey(name: 'response_time_ms')  double? responseTimeMs, @JsonKey(name: 'total_time_ms')  double? totalTimeMs,  String? intent, @JsonKey(name: 'data_source')  String? dataSource, @JsonKey(name: 'cached_at')  String? cachedAt, @JsonKey(name: '__metadata__')  bool? metadata)  $default,) {final _that = this;
switch (_that) {
case _IraChatSendResponseModel():
return $default(_that.answer,_that.response,_that.suggestedQuestions,_that.sources,_that.chatId,_that.sessionId,_that.messageId,_that.modelUsed,_that.providerName,_that.responseTimeMs,_that.totalTimeMs,_that.intent,_that.dataSource,_that.cachedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? answer,  String? response, @JsonKey(name: 'suggested_questions')  List<String>? suggestedQuestions,  List<dynamic>? sources, @JsonKey(name: 'chat_id')  String? chatId, @JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'message_id')  String? messageId, @JsonKey(name: 'model_used')  String? modelUsed, @JsonKey(name: 'provider_name')  String? providerName, @JsonKey(name: 'response_time_ms')  double? responseTimeMs, @JsonKey(name: 'total_time_ms')  double? totalTimeMs,  String? intent, @JsonKey(name: 'data_source')  String? dataSource, @JsonKey(name: 'cached_at')  String? cachedAt, @JsonKey(name: '__metadata__')  bool? metadata)?  $default,) {final _that = this;
switch (_that) {
case _IraChatSendResponseModel() when $default != null:
return $default(_that.answer,_that.response,_that.suggestedQuestions,_that.sources,_that.chatId,_that.sessionId,_that.messageId,_that.modelUsed,_that.providerName,_that.responseTimeMs,_that.totalTimeMs,_that.intent,_that.dataSource,_that.cachedAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IraChatSendResponseModel implements IraChatSendResponseModel {
  const _IraChatSendResponseModel({this.answer, this.response, @JsonKey(name: 'suggested_questions') final  List<String>? suggestedQuestions, final  List<dynamic>? sources, @JsonKey(name: 'chat_id') this.chatId, @JsonKey(name: 'session_id') this.sessionId, @JsonKey(name: 'message_id') this.messageId, @JsonKey(name: 'model_used') this.modelUsed, @JsonKey(name: 'provider_name') this.providerName, @JsonKey(name: 'response_time_ms') this.responseTimeMs, @JsonKey(name: 'total_time_ms') this.totalTimeMs, this.intent, @JsonKey(name: 'data_source') this.dataSource, @JsonKey(name: 'cached_at') this.cachedAt, @JsonKey(name: '__metadata__') this.metadata}): _suggestedQuestions = suggestedQuestions,_sources = sources;
  factory _IraChatSendResponseModel.fromJson(Map<String, dynamic> json) => _$IraChatSendResponseModelFromJson(json);

@override final  String? answer;
@override final  String? response;
 final  List<String>? _suggestedQuestions;
@override@JsonKey(name: 'suggested_questions') List<String>? get suggestedQuestions {
  final value = _suggestedQuestions;
  if (value == null) return null;
  if (_suggestedQuestions is EqualUnmodifiableListView) return _suggestedQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _sources;
@override List<dynamic>? get sources {
  final value = _sources;
  if (value == null) return null;
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'chat_id') final  String? chatId;
@override@JsonKey(name: 'session_id') final  String? sessionId;
@override@JsonKey(name: 'message_id') final  String? messageId;
@override@JsonKey(name: 'model_used') final  String? modelUsed;
@override@JsonKey(name: 'provider_name') final  String? providerName;
@override@JsonKey(name: 'response_time_ms') final  double? responseTimeMs;
@override@JsonKey(name: 'total_time_ms') final  double? totalTimeMs;
@override final  String? intent;
@override@JsonKey(name: 'data_source') final  String? dataSource;
@override@JsonKey(name: 'cached_at') final  String? cachedAt;
@override@JsonKey(name: '__metadata__') final  bool? metadata;

/// Create a copy of IraChatSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IraChatSendResponseModelCopyWith<_IraChatSendResponseModel> get copyWith => __$IraChatSendResponseModelCopyWithImpl<_IraChatSendResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IraChatSendResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IraChatSendResponseModel&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.response, response) || other.response == response)&&const DeepCollectionEquality().equals(other._suggestedQuestions, _suggestedQuestions)&&const DeepCollectionEquality().equals(other._sources, _sources)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.responseTimeMs, responseTimeMs) || other.responseTimeMs == responseTimeMs)&&(identical(other.totalTimeMs, totalTimeMs) || other.totalTimeMs == totalTimeMs)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answer,response,const DeepCollectionEquality().hash(_suggestedQuestions),const DeepCollectionEquality().hash(_sources),chatId,sessionId,messageId,modelUsed,providerName,responseTimeMs,totalTimeMs,intent,dataSource,cachedAt,metadata);

@override
String toString() {
  return 'IraChatSendResponseModel(answer: $answer, response: $response, suggestedQuestions: $suggestedQuestions, sources: $sources, chatId: $chatId, sessionId: $sessionId, messageId: $messageId, modelUsed: $modelUsed, providerName: $providerName, responseTimeMs: $responseTimeMs, totalTimeMs: $totalTimeMs, intent: $intent, dataSource: $dataSource, cachedAt: $cachedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$IraChatSendResponseModelCopyWith<$Res> implements $IraChatSendResponseModelCopyWith<$Res> {
  factory _$IraChatSendResponseModelCopyWith(_IraChatSendResponseModel value, $Res Function(_IraChatSendResponseModel) _then) = __$IraChatSendResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? answer, String? response,@JsonKey(name: 'suggested_questions') List<String>? suggestedQuestions, List<dynamic>? sources,@JsonKey(name: 'chat_id') String? chatId,@JsonKey(name: 'session_id') String? sessionId,@JsonKey(name: 'message_id') String? messageId,@JsonKey(name: 'model_used') String? modelUsed,@JsonKey(name: 'provider_name') String? providerName,@JsonKey(name: 'response_time_ms') double? responseTimeMs,@JsonKey(name: 'total_time_ms') double? totalTimeMs, String? intent,@JsonKey(name: 'data_source') String? dataSource,@JsonKey(name: 'cached_at') String? cachedAt,@JsonKey(name: '__metadata__') bool? metadata
});




}
/// @nodoc
class __$IraChatSendResponseModelCopyWithImpl<$Res>
    implements _$IraChatSendResponseModelCopyWith<$Res> {
  __$IraChatSendResponseModelCopyWithImpl(this._self, this._then);

  final _IraChatSendResponseModel _self;
  final $Res Function(_IraChatSendResponseModel) _then;

/// Create a copy of IraChatSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? answer = freezed,Object? response = freezed,Object? suggestedQuestions = freezed,Object? sources = freezed,Object? chatId = freezed,Object? sessionId = freezed,Object? messageId = freezed,Object? modelUsed = freezed,Object? providerName = freezed,Object? responseTimeMs = freezed,Object? totalTimeMs = freezed,Object? intent = freezed,Object? dataSource = freezed,Object? cachedAt = freezed,Object? metadata = freezed,}) {
  return _then(_IraChatSendResponseModel(
answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,suggestedQuestions: freezed == suggestedQuestions ? _self._suggestedQuestions : suggestedQuestions // ignore: cast_nullable_to_non_nullable
as List<String>?,sources: freezed == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,modelUsed: freezed == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String?,providerName: freezed == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String?,responseTimeMs: freezed == responseTimeMs ? _self.responseTimeMs : responseTimeMs // ignore: cast_nullable_to_non_nullable
as double?,totalTimeMs: freezed == totalTimeMs ? _self.totalTimeMs : totalTimeMs // ignore: cast_nullable_to_non_nullable
as double?,intent: freezed == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
