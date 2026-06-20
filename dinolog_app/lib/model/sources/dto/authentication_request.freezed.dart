// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenticationRequest {

 String get username; String get password;
/// Create a copy of AuthenticationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationRequestCopyWith<AuthenticationRequest> get copyWith => _$AuthenticationRequestCopyWithImpl<AuthenticationRequest>(this as AuthenticationRequest, _$identity);

  /// Serializes this AuthenticationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'AuthenticationRequest(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthenticationRequestCopyWith<$Res>  {
  factory $AuthenticationRequestCopyWith(AuthenticationRequest value, $Res Function(AuthenticationRequest) _then) = _$AuthenticationRequestCopyWithImpl;
@useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class _$AuthenticationRequestCopyWithImpl<$Res>
    implements $AuthenticationRequestCopyWith<$Res> {
  _$AuthenticationRequestCopyWithImpl(this._self, this._then);

  final AuthenticationRequest _self;
  final $Res Function(AuthenticationRequest) _then;

/// Create a copy of AuthenticationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthenticationRequest].
extension AuthenticationRequestPatterns on AuthenticationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthenticationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthenticationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthenticationRequest value)  $default,){
final _that = this;
switch (_that) {
case _AuthenticationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthenticationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AuthenticationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthenticationRequest() when $default != null:
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password)  $default,) {final _that = this;
switch (_that) {
case _AuthenticationRequest():
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password)?  $default,) {final _that = this;
switch (_that) {
case _AuthenticationRequest() when $default != null:
return $default(_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _AuthenticationRequest implements AuthenticationRequest {
  const _AuthenticationRequest({required this.username, required this.password});
  factory _AuthenticationRequest.fromJson(Map<String, dynamic> json) => _$AuthenticationRequestFromJson(json);

@override final  String username;
@override final  String password;

/// Create a copy of AuthenticationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticationRequestCopyWith<_AuthenticationRequest> get copyWith => __$AuthenticationRequestCopyWithImpl<_AuthenticationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthenticationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticationRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'AuthenticationRequest(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AuthenticationRequestCopyWith<$Res> implements $AuthenticationRequestCopyWith<$Res> {
  factory _$AuthenticationRequestCopyWith(_AuthenticationRequest value, $Res Function(_AuthenticationRequest) _then) = __$AuthenticationRequestCopyWithImpl;
@override @useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class __$AuthenticationRequestCopyWithImpl<$Res>
    implements _$AuthenticationRequestCopyWith<$Res> {
  __$AuthenticationRequestCopyWithImpl(this._self, this._then);

  final _AuthenticationRequest _self;
  final $Res Function(_AuthenticationRequest) _then;

/// Create a copy of AuthenticationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,}) {
  return _then(_AuthenticationRequest(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
