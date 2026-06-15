import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry.freezed.dart';
part 'log_entry.g.dart';

@freezed
abstract class LogEntry with _$LogEntry {
  @JsonSerializable(explicitToJson: true)
  const factory LogEntry({
    @JsonKey(name: 'remote_addr') required String remoteAddr,
    @JsonKey(name: 'remote_user') required String remoteUser,
    @JsonKey(name: 'time_local') required DateTime timeLocal,
    @JsonKey(name: 'http_method') required String httpMethod,
    @JsonKey(name: 'request_path') required String requestPath,
    @JsonKey(name: 'http_version') required String httpVersion,
    @JsonKey(name: 'status_code') required String statusCode,
    @JsonKey(name: 'http_referer') required String httpReferer,
    @JsonKey(name: 'http_user_agent') required String httpUserAgent,
  }) = _LogEntry;

  factory LogEntry.fromJson(Map<String, dynamic> json) =>
      _$LogEntryFromJson(json);
}

extension LogEntryExtension on LogEntry {
  int get statusCodeAsInt => int.tryParse(statusCode) ?? 0;

  bool get isSuccess => statusCodeAsInt >= 200 && statusCodeAsInt < 300;

  bool get isRedirect => statusCodeAsInt >= 300 && statusCodeAsInt < 400;

  bool get isClientError => statusCodeAsInt >= 400 && statusCodeAsInt < 500;

  bool get isServerError => statusCodeAsInt >= 500 && statusCodeAsInt < 600;
}
