// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogEntries _$LogEntriesFromJson(Map<String, dynamic> json) => _LogEntries(
  entries: (json['entries'] as List<dynamic>)
      .map((e) => LogEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LogEntriesToJson(_LogEntries instance) =>
    <String, dynamic>{
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
