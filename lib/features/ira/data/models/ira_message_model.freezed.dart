// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ira_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IraMessageModel {

 String get id; String get agentId; String get sender; String get text; String get timestamp; List<String>? get suggestions; String? get modelUsed; double? get responseTimeMs; String? get intent; String? get dataSource; String? get chatId;
/// Create a copy of IraMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IraMessageModelCopyWith<IraMessageModel> get copyWith => _$IraMessageModelCopyWithImpl<IraMessageModel>(this as IraMessageModel, _$identity);

  /// Serializes this IraMessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IraMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.text, text) || other.text == text)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed)&&(identical(other.responseTimeMs, responseTimeMs) || other.responseTimeMs == responseTimeMs)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.chatId, chatId) || other.chatId == chatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,agentId,sender,text,timestamp,const DeepCollectionEquality().hash(suggestions),modelUsed,responseTimeMs,intent,dataSource,chatId);

@override
String toString() {
  return 'IraMessageModel(id: $id, agentId: $agentId, sender: $sender, text: $text, timestamp: $timestamp, suggestions: $suggestions, modelUsed: $modelUsed, responseTimeMs: $responseTimeMs, intent: $intent, dataSource: $dataSource, chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class $IraMessageModelCopyWith<$Res>  {
  factory $IraMessageModelCopyWith(IraMessageModel value, $Res Function(IraMessageModel) _then) = _$IraMessageModelCopyWithImpl;
@useResult
$Res call({
 String id, String agentId, String sender, String text, String timestamp, List<String>? suggestions, String? modelUsed, double? responseTimeMs, String? intent, String? dataSource, String? chatId
});




}
/// @nodoc
class _$IraMessageModelCopyWithImpl<$Res>
    implements $IraMessageModelCopyWith<$Res> {
  _$IraMessageModelCopyWithImpl(this._self, this._then);

  final IraMessageModel _self;
  final $Res Function(IraMessageModel) _then;

/// Create a copy of IraMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? agentId = null,Object? sender = null,Object? text = null,Object? timestamp = null,Object? suggestions = freezed,Object? modelUsed = freezed,Object? responseTimeMs = freezed,Object? intent = freezed,Object? dataSource = freezed,Object? chatId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,suggestions: freezed == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>?,modelUsed: freezed == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String?,responseTimeMs: freezed == responseTimeMs ? _self.responseTimeMs : responseTimeMs // ignore: cast_nullable_to_non_nullable
as double?,intent: freezed == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IraMessageModel].
extension IraMessageModelPatterns on IraMessageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IraMessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IraMessageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IraMessageModel value)  $default,){
final _that = this;
switch (_that) {
case _IraMessageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IraMessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _IraMessageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String agentId,  String sender,  String text,  String timestamp,  List<String>? suggestions,  String? modelUsed,  double? responseTimeMs,  String? intent,  String? dataSource,  String? chatId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IraMessageModel() when $default != null:
return $default(_that.id,_that.agentId,_that.sender,_that.text,_that.timestamp,_that.suggestions,_that.modelUsed,_that.responseTimeMs,_that.intent,_that.dataSource,_that.chatId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String agentId,  String sender,  String text,  String timestamp,  List<String>? suggestions,  String? modelUsed,  double? responseTimeMs,  String? intent,  String? dataSource,  String? chatId)  $default,) {final _that = this;
switch (_that) {
case _IraMessageModel():
return $default(_that.id,_that.agentId,_that.sender,_that.text,_that.timestamp,_that.suggestions,_that.modelUsed,_that.responseTimeMs,_that.intent,_that.dataSource,_that.chatId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String agentId,  String sender,  String text,  String timestamp,  List<String>? suggestions,  String? modelUsed,  double? responseTimeMs,  String? intent,  String? dataSource,  String? chatId)?  $default,) {final _that = this;
switch (_that) {
case _IraMessageModel() when $default != null:
return $default(_that.id,_that.agentId,_that.sender,_that.text,_that.timestamp,_that.suggestions,_that.modelUsed,_that.responseTimeMs,_that.intent,_that.dataSource,_that.chatId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IraMessageModel extends IraMessageModel {
  const _IraMessageModel({required this.id, required this.agentId, required this.sender, required this.text, required this.timestamp, final  List<String>? suggestions, this.modelUsed, this.responseTimeMs, this.intent, this.dataSource, this.chatId}): _suggestions = suggestions,super._();
  factory _IraMessageModel.fromJson(Map<String, dynamic> json) => _$IraMessageModelFromJson(json);

@override final  String id;
@override final  String agentId;
@override final  String sender;
@override final  String text;
@override final  String timestamp;
 final  List<String>? _suggestions;
@override List<String>? get suggestions {
  final value = _suggestions;
  if (value == null) return null;
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? modelUsed;
@override final  double? responseTimeMs;
@override final  String? intent;
@override final  String? dataSource;
@override final  String? chatId;

/// Create a copy of IraMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IraMessageModelCopyWith<_IraMessageModel> get copyWith => __$IraMessageModelCopyWithImpl<_IraMessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IraMessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IraMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.text, text) || other.text == text)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed)&&(identical(other.responseTimeMs, responseTimeMs) || other.responseTimeMs == responseTimeMs)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.chatId, chatId) || other.chatId == chatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,agentId,sender,text,timestamp,const DeepCollectionEquality().hash(_suggestions),modelUsed,responseTimeMs,intent,dataSource,chatId);

@override
String toString() {
  return 'IraMessageModel(id: $id, agentId: $agentId, sender: $sender, text: $text, timestamp: $timestamp, suggestions: $suggestions, modelUsed: $modelUsed, responseTimeMs: $responseTimeMs, intent: $intent, dataSource: $dataSource, chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class _$IraMessageModelCopyWith<$Res> implements $IraMessageModelCopyWith<$Res> {
  factory _$IraMessageModelCopyWith(_IraMessageModel value, $Res Function(_IraMessageModel) _then) = __$IraMessageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String agentId, String sender, String text, String timestamp, List<String>? suggestions, String? modelUsed, double? responseTimeMs, String? intent, String? dataSource, String? chatId
});




}
/// @nodoc
class __$IraMessageModelCopyWithImpl<$Res>
    implements _$IraMessageModelCopyWith<$Res> {
  __$IraMessageModelCopyWithImpl(this._self, this._then);

  final _IraMessageModel _self;
  final $Res Function(_IraMessageModel) _then;

/// Create a copy of IraMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? agentId = null,Object? sender = null,Object? text = null,Object? timestamp = null,Object? suggestions = freezed,Object? modelUsed = freezed,Object? responseTimeMs = freezed,Object? intent = freezed,Object? dataSource = freezed,Object? chatId = freezed,}) {
  return _then(_IraMessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,suggestions: freezed == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>?,modelUsed: freezed == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String?,responseTimeMs: freezed == responseTimeMs ? _self.responseTimeMs : responseTimeMs // ignore: cast_nullable_to_non_nullable
as double?,intent: freezed == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
