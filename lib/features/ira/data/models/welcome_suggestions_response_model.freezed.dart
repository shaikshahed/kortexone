// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_suggestions_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WelcomeSuggestionsResponseModel {

 List<String> get suggestions;@JsonKey(name: 'live_connectors') List<String> get liveConnectors;
/// Create a copy of WelcomeSuggestionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeSuggestionsResponseModelCopyWith<WelcomeSuggestionsResponseModel> get copyWith => _$WelcomeSuggestionsResponseModelCopyWithImpl<WelcomeSuggestionsResponseModel>(this as WelcomeSuggestionsResponseModel, _$identity);

  /// Serializes this WelcomeSuggestionsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeSuggestionsResponseModel&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&const DeepCollectionEquality().equals(other.liveConnectors, liveConnectors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(suggestions),const DeepCollectionEquality().hash(liveConnectors));

@override
String toString() {
  return 'WelcomeSuggestionsResponseModel(suggestions: $suggestions, liveConnectors: $liveConnectors)';
}


}

/// @nodoc
abstract mixin class $WelcomeSuggestionsResponseModelCopyWith<$Res>  {
  factory $WelcomeSuggestionsResponseModelCopyWith(WelcomeSuggestionsResponseModel value, $Res Function(WelcomeSuggestionsResponseModel) _then) = _$WelcomeSuggestionsResponseModelCopyWithImpl;
@useResult
$Res call({
 List<String> suggestions,@JsonKey(name: 'live_connectors') List<String> liveConnectors
});




}
/// @nodoc
class _$WelcomeSuggestionsResponseModelCopyWithImpl<$Res>
    implements $WelcomeSuggestionsResponseModelCopyWith<$Res> {
  _$WelcomeSuggestionsResponseModelCopyWithImpl(this._self, this._then);

  final WelcomeSuggestionsResponseModel _self;
  final $Res Function(WelcomeSuggestionsResponseModel) _then;

/// Create a copy of WelcomeSuggestionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suggestions = null,Object? liveConnectors = null,}) {
  return _then(_self.copyWith(
suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,liveConnectors: null == liveConnectors ? _self.liveConnectors : liveConnectors // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeSuggestionsResponseModel].
extension WelcomeSuggestionsResponseModelPatterns on WelcomeSuggestionsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeSuggestionsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeSuggestionsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeSuggestionsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeSuggestionsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeSuggestionsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeSuggestionsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> suggestions, @JsonKey(name: 'live_connectors')  List<String> liveConnectors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeSuggestionsResponseModel() when $default != null:
return $default(_that.suggestions,_that.liveConnectors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> suggestions, @JsonKey(name: 'live_connectors')  List<String> liveConnectors)  $default,) {final _that = this;
switch (_that) {
case _WelcomeSuggestionsResponseModel():
return $default(_that.suggestions,_that.liveConnectors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> suggestions, @JsonKey(name: 'live_connectors')  List<String> liveConnectors)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeSuggestionsResponseModel() when $default != null:
return $default(_that.suggestions,_that.liveConnectors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WelcomeSuggestionsResponseModel extends WelcomeSuggestionsResponseModel {
  const _WelcomeSuggestionsResponseModel({required final  List<String> suggestions, @JsonKey(name: 'live_connectors') required final  List<String> liveConnectors}): _suggestions = suggestions,_liveConnectors = liveConnectors,super._();
  factory _WelcomeSuggestionsResponseModel.fromJson(Map<String, dynamic> json) => _$WelcomeSuggestionsResponseModelFromJson(json);

 final  List<String> _suggestions;
@override List<String> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

 final  List<String> _liveConnectors;
@override@JsonKey(name: 'live_connectors') List<String> get liveConnectors {
  if (_liveConnectors is EqualUnmodifiableListView) return _liveConnectors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_liveConnectors);
}


/// Create a copy of WelcomeSuggestionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeSuggestionsResponseModelCopyWith<_WelcomeSuggestionsResponseModel> get copyWith => __$WelcomeSuggestionsResponseModelCopyWithImpl<_WelcomeSuggestionsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WelcomeSuggestionsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeSuggestionsResponseModel&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&const DeepCollectionEquality().equals(other._liveConnectors, _liveConnectors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_suggestions),const DeepCollectionEquality().hash(_liveConnectors));

@override
String toString() {
  return 'WelcomeSuggestionsResponseModel(suggestions: $suggestions, liveConnectors: $liveConnectors)';
}


}

/// @nodoc
abstract mixin class _$WelcomeSuggestionsResponseModelCopyWith<$Res> implements $WelcomeSuggestionsResponseModelCopyWith<$Res> {
  factory _$WelcomeSuggestionsResponseModelCopyWith(_WelcomeSuggestionsResponseModel value, $Res Function(_WelcomeSuggestionsResponseModel) _then) = __$WelcomeSuggestionsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> suggestions,@JsonKey(name: 'live_connectors') List<String> liveConnectors
});




}
/// @nodoc
class __$WelcomeSuggestionsResponseModelCopyWithImpl<$Res>
    implements _$WelcomeSuggestionsResponseModelCopyWith<$Res> {
  __$WelcomeSuggestionsResponseModelCopyWithImpl(this._self, this._then);

  final _WelcomeSuggestionsResponseModel _self;
  final $Res Function(_WelcomeSuggestionsResponseModel) _then;

/// Create a copy of WelcomeSuggestionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suggestions = null,Object? liveConnectors = null,}) {
  return _then(_WelcomeSuggestionsResponseModel(
suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,liveConnectors: null == liveConnectors ? _self._liveConnectors : liveConnectors // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
