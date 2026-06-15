// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogEntry _$LogEntryFromJson(Map<String, dynamic> json) => _LogEntry(
  remoteAddr: json['remote_addr'] as String,
  remoteUser: json['remote_user'] as String,
  timeLocal: DateTime.parse(json['time_local'] as String),
  httpMethod: json['http_method'] as String,
  requestPath: json['request_path'] as String,
  httpVersion: json['http_version'] as String,
  statusCode: json['status_code'] as String,
  httpReferer: json['http_referer'] as String,
  httpUserAgent: json['http_user_agent'] as String,
);

Map<String, dynamic> _$LogEntryToJson(_LogEntry instance) => <String, dynamic>{
  'remote_addr': instance.remoteAddr,
  'remote_user': instance.remoteUser,
  'time_local': instance.timeLocal.toIso8601String(),
  'http_method': instance.httpMethod,
  'request_path': instance.requestPath,
  'http_version': instance.httpVersion,
  'status_code': instance.statusCode,
  'http_referer': instance.httpReferer,
  'http_user_agent': instance.httpUserAgent,
};
