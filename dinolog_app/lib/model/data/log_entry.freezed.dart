// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogEntry {

@JsonKey(name: 'remote_addr') String get remoteAddr;@JsonKey(name: 'remote_user') String get remoteUser;@JsonKey(name: 'time_local') DateTime get timeLocal;@JsonKey(name: 'http_method') String get httpMethod;@JsonKey(name: 'request_path') String get requestPath;@JsonKey(name: 'http_version') String get httpVersion;@JsonKey(name: 'status_code') String get statusCode;@JsonKey(name: 'http_referer') String get httpReferer;@JsonKey(name: 'http_user_agent') String get httpUserAgent;
/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogEntryCopyWith<LogEntry> get copyWith => _$LogEntryCopyWithImpl<LogEntry>(this as LogEntry, _$identity);

  /// Serializes this LogEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogEntry&&(identical(other.remoteAddr, remoteAddr) || other.remoteAddr == remoteAddr)&&(identical(other.remoteUser, remoteUser) || other.remoteUser == remoteUser)&&(identical(other.timeLocal, timeLocal) || other.timeLocal == timeLocal)&&(identical(other.httpMethod, httpMethod) || other.httpMethod == httpMethod)&&(identical(other.requestPath, requestPath) || other.requestPath == requestPath)&&(identical(other.httpVersion, httpVersion) || other.httpVersion == httpVersion)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.httpReferer, httpReferer) || other.httpReferer == httpReferer)&&(identical(other.httpUserAgent, httpUserAgent) || other.httpUserAgent == httpUserAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteAddr,remoteUser,timeLocal,httpMethod,requestPath,httpVersion,statusCode,httpReferer,httpUserAgent);

@override
String toString() {
  return 'LogEntry(remoteAddr: $remoteAddr, remoteUser: $remoteUser, timeLocal: $timeLocal, httpMethod: $httpMethod, requestPath: $requestPath, httpVersion: $httpVersion, statusCode: $statusCode, httpReferer: $httpReferer, httpUserAgent: $httpUserAgent)';
}


}

/// @nodoc
abstract mixin class $LogEntryCopyWith<$Res>  {
  factory $LogEntryCopyWith(LogEntry value, $Res Function(LogEntry) _then) = _$LogEntryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'remote_addr') String remoteAddr,@JsonKey(name: 'remote_user') String remoteUser,@JsonKey(name: 'time_local') DateTime timeLocal,@JsonKey(name: 'http_method') String httpMethod,@JsonKey(name: 'request_path') String requestPath,@JsonKey(name: 'http_version') String httpVersion,@JsonKey(name: 'status_code') String statusCode,@JsonKey(name: 'http_referer') String httpReferer,@JsonKey(name: 'http_user_agent') String httpUserAgent
});




}
/// @nodoc
class _$LogEntryCopyWithImpl<$Res>
    implements $LogEntryCopyWith<$Res> {
  _$LogEntryCopyWithImpl(this._self, this._then);

  final LogEntry _self;
  final $Res Function(LogEntry) _then;

/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteAddr = null,Object? remoteUser = null,Object? timeLocal = null,Object? httpMethod = null,Object? requestPath = null,Object? httpVersion = null,Object? statusCode = null,Object? httpReferer = null,Object? httpUserAgent = null,}) {
  return _then(_self.copyWith(
remoteAddr: null == remoteAddr ? _self.remoteAddr : remoteAddr // ignore: cast_nullable_to_non_nullable
as String,remoteUser: null == remoteUser ? _self.remoteUser : remoteUser // ignore: cast_nullable_to_non_nullable
as String,timeLocal: null == timeLocal ? _self.timeLocal : timeLocal // ignore: cast_nullable_to_non_nullable
as DateTime,httpMethod: null == httpMethod ? _self.httpMethod : httpMethod // ignore: cast_nullable_to_non_nullable
as String,requestPath: null == requestPath ? _self.requestPath : requestPath // ignore: cast_nullable_to_non_nullable
as String,httpVersion: null == httpVersion ? _self.httpVersion : httpVersion // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String,httpReferer: null == httpReferer ? _self.httpReferer : httpReferer // ignore: cast_nullable_to_non_nullable
as String,httpUserAgent: null == httpUserAgent ? _self.httpUserAgent : httpUserAgent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogEntry].
extension LogEntryPatterns on LogEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogEntry value)  $default,){
final _that = this;
switch (_that) {
case _LogEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogEntry value)?  $default,){
final _that = this;
switch (_that) {
case _LogEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'remote_addr')  String remoteAddr, @JsonKey(name: 'remote_user')  String remoteUser, @JsonKey(name: 'time_local')  DateTime timeLocal, @JsonKey(name: 'http_method')  String httpMethod, @JsonKey(name: 'request_path')  String requestPath, @JsonKey(name: 'http_version')  String httpVersion, @JsonKey(name: 'status_code')  String statusCode, @JsonKey(name: 'http_referer')  String httpReferer, @JsonKey(name: 'http_user_agent')  String httpUserAgent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogEntry() when $default != null:
return $default(_that.remoteAddr,_that.remoteUser,_that.timeLocal,_that.httpMethod,_that.requestPath,_that.httpVersion,_that.statusCode,_that.httpReferer,_that.httpUserAgent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'remote_addr')  String remoteAddr, @JsonKey(name: 'remote_user')  String remoteUser, @JsonKey(name: 'time_local')  DateTime timeLocal, @JsonKey(name: 'http_method')  String httpMethod, @JsonKey(name: 'request_path')  String requestPath, @JsonKey(name: 'http_version')  String httpVersion, @JsonKey(name: 'status_code')  String statusCode, @JsonKey(name: 'http_referer')  String httpReferer, @JsonKey(name: 'http_user_agent')  String httpUserAgent)  $default,) {final _that = this;
switch (_that) {
case _LogEntry():
return $default(_that.remoteAddr,_that.remoteUser,_that.timeLocal,_that.httpMethod,_that.requestPath,_that.httpVersion,_that.statusCode,_that.httpReferer,_that.httpUserAgent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'remote_addr')  String remoteAddr, @JsonKey(name: 'remote_user')  String remoteUser, @JsonKey(name: 'time_local')  DateTime timeLocal, @JsonKey(name: 'http_method')  String httpMethod, @JsonKey(name: 'request_path')  String requestPath, @JsonKey(name: 'http_version')  String httpVersion, @JsonKey(name: 'status_code')  String statusCode, @JsonKey(name: 'http_referer')  String httpReferer, @JsonKey(name: 'http_user_agent')  String httpUserAgent)?  $default,) {final _that = this;
switch (_that) {
case _LogEntry() when $default != null:
return $default(_that.remoteAddr,_that.remoteUser,_that.timeLocal,_that.httpMethod,_that.requestPath,_that.httpVersion,_that.statusCode,_that.httpReferer,_that.httpUserAgent);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LogEntry implements LogEntry {
  const _LogEntry({@JsonKey(name: 'remote_addr') required this.remoteAddr, @JsonKey(name: 'remote_user') required this.remoteUser, @JsonKey(name: 'time_local') required this.timeLocal, @JsonKey(name: 'http_method') required this.httpMethod, @JsonKey(name: 'request_path') required this.requestPath, @JsonKey(name: 'http_version') required this.httpVersion, @JsonKey(name: 'status_code') required this.statusCode, @JsonKey(name: 'http_referer') required this.httpReferer, @JsonKey(name: 'http_user_agent') required this.httpUserAgent});
  factory _LogEntry.fromJson(Map<String, dynamic> json) => _$LogEntryFromJson(json);

@override@JsonKey(name: 'remote_addr') final  String remoteAddr;
@override@JsonKey(name: 'remote_user') final  String remoteUser;
@override@JsonKey(name: 'time_local') final  DateTime timeLocal;
@override@JsonKey(name: 'http_method') final  String httpMethod;
@override@JsonKey(name: 'request_path') final  String requestPath;
@override@JsonKey(name: 'http_version') final  String httpVersion;
@override@JsonKey(name: 'status_code') final  String statusCode;
@override@JsonKey(name: 'http_referer') final  String httpReferer;
@override@JsonKey(name: 'http_user_agent') final  String httpUserAgent;

/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogEntryCopyWith<_LogEntry> get copyWith => __$LogEntryCopyWithImpl<_LogEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogEntry&&(identical(other.remoteAddr, remoteAddr) || other.remoteAddr == remoteAddr)&&(identical(other.remoteUser, remoteUser) || other.remoteUser == remoteUser)&&(identical(other.timeLocal, timeLocal) || other.timeLocal == timeLocal)&&(identical(other.httpMethod, httpMethod) || other.httpMethod == httpMethod)&&(identical(other.requestPath, requestPath) || other.requestPath == requestPath)&&(identical(other.httpVersion, httpVersion) || other.httpVersion == httpVersion)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.httpReferer, httpReferer) || other.httpReferer == httpReferer)&&(identical(other.httpUserAgent, httpUserAgent) || other.httpUserAgent == httpUserAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteAddr,remoteUser,timeLocal,httpMethod,requestPath,httpVersion,statusCode,httpReferer,httpUserAgent);

@override
String toString() {
  return 'LogEntry(remoteAddr: $remoteAddr, remoteUser: $remoteUser, timeLocal: $timeLocal, httpMethod: $httpMethod, requestPath: $requestPath, httpVersion: $httpVersion, statusCode: $statusCode, httpReferer: $httpReferer, httpUserAgent: $httpUserAgent)';
}


}

/// @nodoc
abstract mixin class _$LogEntryCopyWith<$Res> implements $LogEntryCopyWith<$Res> {
  factory _$LogEntryCopyWith(_LogEntry value, $Res Function(_LogEntry) _then) = __$LogEntryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'remote_addr') String remoteAddr,@JsonKey(name: 'remote_user') String remoteUser,@JsonKey(name: 'time_local') DateTime timeLocal,@JsonKey(name: 'http_method') String httpMethod,@JsonKey(name: 'request_path') String requestPath,@JsonKey(name: 'http_version') String httpVersion,@JsonKey(name: 'status_code') String statusCode,@JsonKey(name: 'http_referer') String httpReferer,@JsonKey(name: 'http_user_agent') String httpUserAgent
});




}
/// @nodoc
class __$LogEntryCopyWithImpl<$Res>
    implements _$LogEntryCopyWith<$Res> {
  __$LogEntryCopyWithImpl(this._self, this._then);

  final _LogEntry _self;
  final $Res Function(_LogEntry) _then;

/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteAddr = null,Object? remoteUser = null,Object? timeLocal = null,Object? httpMethod = null,Object? requestPath = null,Object? httpVersion = null,Object? statusCode = null,Object? httpReferer = null,Object? httpUserAgent = null,}) {
  return _then(_LogEntry(
remoteAddr: null == remoteAddr ? _self.remoteAddr : remoteAddr // ignore: cast_nullable_to_non_nullable
as String,remoteUser: null == remoteUser ? _self.remoteUser : remoteUser // ignore: cast_nullable_to_non_nullable
as String,timeLocal: null == timeLocal ? _self.timeLocal : timeLocal // ignore: cast_nullable_to_non_nullable
as DateTime,httpMethod: null == httpMethod ? _self.httpMethod : httpMethod // ignore: cast_nullable_to_non_nullable
as String,requestPath: null == requestPath ? _self.requestPath : requestPath // ignore: cast_nullable_to_non_nullable
as String,httpVersion: null == httpVersion ? _self.httpVersion : httpVersion // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String,httpReferer: null == httpReferer ? _self.httpReferer : httpReferer // ignore: cast_nullable_to_non_nullable
as String,httpUserAgent: null == httpUserAgent ? _self.httpUserAgent : httpUserAgent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
