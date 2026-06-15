// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_infos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IpInfos _$IpInfosFromJson(Map<String, dynamic> json) => _IpInfos(
  ip: json['ip'] as String,
  city: json['city'] as String,
  region: json['region'] as String,
  country: json['country'] as String,
  loc: json['loc'] as String,
  org: json['org'] as String,
  postal: json['postal'] as String,
  timezone: json['timezone'] as String,
);

Map<String, dynamic> _$IpInfosToJson(_IpInfos instance) => <String, dynamic>{
  'ip': instance.ip,
  'city': instance.city,
  'region': instance.region,
  'country': instance.country,
  'loc': instance.loc,
  'org': instance.org,
  'postal': instance.postal,
  'timezone': instance.timezone,
};
