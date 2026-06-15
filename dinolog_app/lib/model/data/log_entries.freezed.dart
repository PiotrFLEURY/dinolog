// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_entries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogEntries {

 List<LogEntry> get entries;
/// Create a copy of LogEntries
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogEntriesCopyWith<LogEntries> get copyWith => _$LogEntriesCopyWithImpl<LogEntries>(this as LogEntries, _$identity);

  /// Serializes this LogEntries to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogEntries&&const DeepCollectionEquality().equals(other.entries, entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entries));

@override
String toString() {
  return 'LogEntries(entries: $entries)';
}


}

/// @nodoc
abstract mixin class $LogEntriesCopyWith<$Res>  {
  factory $LogEntriesCopyWith(LogEntries value, $Res Function(LogEntries) _then) = _$LogEntriesCopyWithImpl;
@useResult
$Res call({
 List<LogEntry> entries
});




}
/// @nodoc
class _$LogEntriesCopyWithImpl<$Res>
    implements $LogEntriesCopyWith<$Res> {
  _$LogEntriesCopyWithImpl(this._self, this._then);

  final LogEntries _self;
  final $Res Function(LogEntries) _then;

/// Create a copy of LogEntries
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,}) {
  return _then(_self.copyWith(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<LogEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [LogEntries].
extension LogEntriesPatterns on LogEntries {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogEntries value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogEntries() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogEntries value)  $default,){
final _that = this;
switch (_that) {
case _LogEntries():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogEntries value)?  $default,){
final _that = this;
switch (_that) {
case _LogEntries() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LogEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogEntries() when $default != null:
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LogEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _LogEntries():
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LogEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _LogEntries() when $default != null:
return $default(_that.entries);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LogEntries implements LogEntries {
  const _LogEntries({required final  List<LogEntry> entries}): _entries = entries;
  factory _LogEntries.fromJson(Map<String, dynamic> json) => _$LogEntriesFromJson(json);

 final  List<LogEntry> _entries;
@override List<LogEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of LogEntries
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogEntriesCopyWith<_LogEntries> get copyWith => __$LogEntriesCopyWithImpl<_LogEntries>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogEntriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogEntries&&const DeepCollectionEquality().equals(other._entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'LogEntries(entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$LogEntriesCopyWith<$Res> implements $LogEntriesCopyWith<$Res> {
  factory _$LogEntriesCopyWith(_LogEntries value, $Res Function(_LogEntries) _then) = __$LogEntriesCopyWithImpl;
@override @useResult
$Res call({
 List<LogEntry> entries
});




}
/// @nodoc
class __$LogEntriesCopyWithImpl<$Res>
    implements _$LogEntriesCopyWith<$Res> {
  __$LogEntriesCopyWithImpl(this._self, this._then);

  final _LogEntries _self;
  final $Res Function(_LogEntries) _then;

/// Create a copy of LogEntries
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,}) {
  return _then(_LogEntries(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<LogEntry>,
  ));
}


}

// dart format on
