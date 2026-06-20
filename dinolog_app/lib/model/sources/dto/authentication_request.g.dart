// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticationRequest _$AuthenticationRequestFromJson(
  Map<String, dynamic> json,
) => _AuthenticationRequest(
  username: json['username'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$AuthenticationRequestToJson(
  _AuthenticationRequest instance,
) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
};
