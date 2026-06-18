// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_suggestions_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WelcomeSuggestionsRequestModel {

@JsonKey(name: 'assistant_id') String get assistantId;@JsonKey(name: 'assistant_name') String get assistantName; List<String> get connectors;
/// Create a copy of WelcomeSuggestionsRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeSuggestionsRequestModelCopyWith<WelcomeSuggestionsRequestModel> get copyWith => _$WelcomeSuggestionsRequestModelCopyWithImpl<WelcomeSuggestionsRequestModel>(this as WelcomeSuggestionsRequestModel, _$identity);

  /// Serializes this WelcomeSuggestionsRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeSuggestionsRequestModel&&(identical(other.assistantId, assistantId) || other.assistantId == assistantId)&&(identical(other.assistantName, assistantName) || other.assistantName == assistantName)&&const DeepCollectionEquality().equals(other.connectors, connectors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assistantId,assistantName,const DeepCollectionEquality().hash(connectors));

@override
String toString() {
  return 'WelcomeSuggestionsRequestModel(assistantId: $assistantId, assistantName: $assistantName, connectors: $connectors)';
}


}

/// @nodoc
abstract mixin class $WelcomeSuggestionsRequestModelCopyWith<$Res>  {
  factory $WelcomeSuggestionsRequestModelCopyWith(WelcomeSuggestionsRequestModel value, $Res Function(WelcomeSuggestionsRequestModel) _then) = _$WelcomeSuggestionsRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'assistant_id') String assistantId,@JsonKey(name: 'assistant_name') String assistantName, List<String> connectors
});




}
/// @nodoc
class _$WelcomeSuggestionsRequestModelCopyWithImpl<$Res>
    implements $WelcomeSuggestionsRequestModelCopyWith<$Res> {
  _$WelcomeSuggestionsRequestModelCopyWithImpl(this._self, this._then);

  final WelcomeSuggestionsRequestModel _self;
  final $Res Function(WelcomeSuggestionsRequestModel) _then;

/// Create a copy of WelcomeSuggestionsRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assistantId = null,Object? assistantName = null,Object? connectors = null,}) {
  return _then(_self.copyWith(
assistantId: null == assistantId ? _self.assistantId : assistantId // ignore: cast_nullable_to_non_nullable
as String,assistantName: null == assistantName ? _self.assistantName : assistantName // ignore: cast_nullable_to_non_nullable
as String,connectors: null == connectors ? _self.connectors : connectors // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeSuggestionsRequestModel].
extension WelcomeSuggestionsRequestModelPatterns on WelcomeSuggestionsRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeSuggestionsRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeSuggestionsRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeSuggestionsRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeSuggestionsRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeSuggestionsRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeSuggestionsRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'assistant_id')  String assistantId, @JsonKey(name: 'assistant_name')  String assistantName,  List<String> connectors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeSuggestionsRequestModel() when $default != null:
return $default(_that.assistantId,_that.assistantName,_that.connectors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'assistant_id')  String assistantId, @JsonKey(name: 'assistant_name')  String assistantName,  List<String> connectors)  $default,) {final _that = this;
switch (_that) {
case _WelcomeSuggestionsRequestModel():
return $default(_that.assistantId,_that.assistantName,_that.connectors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'assistant_id')  String assistantId, @JsonKey(name: 'assistant_name')  String assistantName,  List<String> connectors)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeSuggestionsRequestModel() when $default != null:
return $default(_that.assistantId,_that.assistantName,_that.connectors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WelcomeSuggestionsRequestModel implements WelcomeSuggestionsRequestModel {
  const _WelcomeSuggestionsRequestModel({@JsonKey(name: 'assistant_id') required this.assistantId, @JsonKey(name: 'assistant_name') required this.assistantName, final  List<String> connectors = const []}): _connectors = connectors;
  factory _WelcomeSuggestionsRequestModel.fromJson(Map<String, dynamic> json) => _$WelcomeSuggestionsRequestModelFromJson(json);

@override@JsonKey(name: 'assistant_id') final  String assistantId;
@override@JsonKey(name: 'assistant_name') final  String assistantName;
 final  List<String> _connectors;
@override@JsonKey() List<String> get connectors {
  if (_connectors is EqualUnmodifiableListView) return _connectors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectors);
}


/// Create a copy of WelcomeSuggestionsRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeSuggestionsRequestModelCopyWith<_WelcomeSuggestionsRequestModel> get copyWith => __$WelcomeSuggestionsRequestModelCopyWithImpl<_WelcomeSuggestionsRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WelcomeSuggestionsRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeSuggestionsRequestModel&&(identical(other.assistantId, assistantId) || other.assistantId == assistantId)&&(identical(other.assistantName, assistantName) || other.assistantName == assistantName)&&const DeepCollectionEquality().equals(other._connectors, _connectors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assistantId,assistantName,const DeepCollectionEquality().hash(_connectors));

@override
String toString() {
  return 'WelcomeSuggestionsRequestModel(assistantId: $assistantId, assistantName: $assistantName, connectors: $connectors)';
}


}

/// @nodoc
abstract mixin class _$WelcomeSuggestionsRequestModelCopyWith<$Res> implements $WelcomeSuggestionsRequestModelCopyWith<$Res> {
  factory _$WelcomeSuggestionsRequestModelCopyWith(_WelcomeSuggestionsRequestModel value, $Res Function(_WelcomeSuggestionsRequestModel) _then) = __$WelcomeSuggestionsRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'assistant_id') String assistantId,@JsonKey(name: 'assistant_name') String assistantName, List<String> connectors
});




}
/// @nodoc
class __$WelcomeSuggestionsRequestModelCopyWithImpl<$Res>
    implements _$WelcomeSuggestionsRequestModelCopyWith<$Res> {
  __$WelcomeSuggestionsRequestModelCopyWithImpl(this._self, this._then);

  final _WelcomeSuggestionsRequestModel _self;
  final $Res Function(_WelcomeSuggestionsRequestModel) _then;

/// Create a copy of WelcomeSuggestionsRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assistantId = null,Object? assistantName = null,Object? connectors = null,}) {
  return _then(_WelcomeSuggestionsRequestModel(
assistantId: null == assistantId ? _self.assistantId : assistantId // ignore: cast_nullable_to_non_nullable
as String,assistantName: null == assistantName ? _self.assistantName : assistantName // ignore: cast_nullable_to_non_nullable
as String,connectors: null == connectors ? _self._connectors : connectors // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
