import 'package:dinolog_app/model/data/log_entries.dart';
import 'package:dinolog_app/model/sources/dinolog_api.dart';
import 'package:intl/intl.dart';

class LogRepository {
  LogRepository(this._api);

  final DinologApi _api;

  static const rfc3339Format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  final DateFormat _dateFormat = DateFormat(rfc3339Format);

  Future<LogEntries> getLogEntries(DateTime from, DateTime to) async {
    final fromString = _dateFormat.format(from);
    final toString = _dateFormat.format(to);
    return await _api.getLogEntries(fromString, toString);
  }
}
