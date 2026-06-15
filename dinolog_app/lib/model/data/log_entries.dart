import 'package:dinolog_app/model/data/log_entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entries.freezed.dart';
part 'log_entries.g.dart';

@freezed
abstract class LogEntries with _$LogEntries {
  @JsonSerializable(explicitToJson: true)
  const factory LogEntries({required List<LogEntry> entries}) = _LogEntries;

  factory LogEntries.fromJson(Map<String, dynamic> json) =>
      _$LogEntriesFromJson(json);
}
