// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ip_infos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IpInfos {

 String get ip; String get city; String get region; String get country; String get loc; String get org; String get postal; String get timezone;
/// Create a copy of IpInfos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IpInfosCopyWith<IpInfos> get copyWith => _$IpInfosCopyWithImpl<IpInfos>(this as IpInfos, _$identity);

  /// Serializes this IpInfos to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IpInfos&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.country, country) || other.country == country)&&(identical(other.loc, loc) || other.loc == loc)&&(identical(other.org, org) || other.org == org)&&(identical(other.postal, postal) || other.postal == postal)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,city,region,country,loc,org,postal,timezone);

@override
String toString() {
  return 'IpInfos(ip: $ip, city: $city, region: $region, country: $country, loc: $loc, org: $org, postal: $postal, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class $IpInfosCopyWith<$Res>  {
  factory $IpInfosCopyWith(IpInfos value, $Res Function(IpInfos) _then) = _$IpInfosCopyWithImpl;
@useResult
$Res call({
 String ip, String city, String region, String country, String loc, String org, String postal, String timezone
});




}
/// @nodoc
class _$IpInfosCopyWithImpl<$Res>
    implements $IpInfosCopyWith<$Res> {
  _$IpInfosCopyWithImpl(this._self, this._then);

  final IpInfos _self;
  final $Res Function(IpInfos) _then;

/// Create a copy of IpInfos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ip = null,Object? city = null,Object? region = null,Object? country = null,Object? loc = null,Object? org = null,Object? postal = null,Object? timezone = null,}) {
  return _then(_self.copyWith(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,loc: null == loc ? _self.loc : loc // ignore: cast_nullable_to_non_nullable
as String,org: null == org ? _self.org : org // ignore: cast_nullable_to_non_nullable
as String,postal: null == postal ? _self.postal : postal // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IpInfos].
extension IpInfosPatterns on IpInfos {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IpInfos value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IpInfos() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IpInfos value)  $default,){
final _that = this;
switch (_that) {
case _IpInfos():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IpInfos value)?  $default,){
final _that = this;
switch (_that) {
case _IpInfos() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ip,  String city,  String region,  String country,  String loc,  String org,  String postal,  String timezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IpInfos() when $default != null:
return $default(_that.ip,_that.city,_that.region,_that.country,_that.loc,_that.org,_that.postal,_that.timezone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ip,  String city,  String region,  String country,  String loc,  String org,  String postal,  String timezone)  $default,) {final _that = this;
switch (_that) {
case _IpInfos():
return $default(_that.ip,_that.city,_that.region,_that.country,_that.loc,_that.org,_that.postal,_that.timezone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ip,  String city,  String region,  String country,  String loc,  String org,  String postal,  String timezone)?  $default,) {final _that = this;
switch (_that) {
case _IpInfos() when $default != null:
return $default(_that.ip,_that.city,_that.region,_that.country,_that.loc,_that.org,_that.postal,_that.timezone);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _IpInfos implements IpInfos {
  const _IpInfos({required this.ip, required this.city, required this.region, required this.country, required this.loc, required this.org, required this.postal, required this.timezone});
  factory _IpInfos.fromJson(Map<String, dynamic> json) => _$IpInfosFromJson(json);

@override final  String ip;
@override final  String city;
@override final  String region;
@override final  String country;
@override final  String loc;
@override final  String org;
@override final  String postal;
@override final  String timezone;

/// Create a copy of IpInfos
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IpInfosCopyWith<_IpInfos> get copyWith => __$IpInfosCopyWithImpl<_IpInfos>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IpInfosToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IpInfos&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.country, country) || other.country == country)&&(identical(other.loc, loc) || other.loc == loc)&&(identical(other.org, org) || other.org == org)&&(identical(other.postal, postal) || other.postal == postal)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,city,region,country,loc,org,postal,timezone);

@override
String toString() {
  return 'IpInfos(ip: $ip, city: $city, region: $region, country: $country, loc: $loc, org: $org, postal: $postal, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class _$IpInfosCopyWith<$Res> implements $IpInfosCopyWith<$Res> {
  factory _$IpInfosCopyWith(_IpInfos value, $Res Function(_IpInfos) _then) = __$IpInfosCopyWithImpl;
@override @useResult
$Res call({
 String ip, String city, String region, String country, String loc, String org, String postal, String timezone
});




}
/// @nodoc
class __$IpInfosCopyWithImpl<$Res>
    implements _$IpInfosCopyWith<$Res> {
  __$IpInfosCopyWithImpl(this._self, this._then);

  final _IpInfos _self;
  final $Res Function(_IpInfos) _then;

/// Create a copy of IpInfos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ip = null,Object? city = null,Object? region = null,Object? country = null,Object? loc = null,Object? org = null,Object? postal = null,Object? timezone = null,}) {
  return _then(_IpInfos(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,loc: null == loc ? _self.loc : loc // ignore: cast_nullable_to_non_nullable
as String,org: null == org ? _self.org : org // ignore: cast_nullable_to_non_nullable
as String,postal: null == postal ? _self.postal : postal // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
