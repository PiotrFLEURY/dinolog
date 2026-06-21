import 'package:dinolog_app/model/converters/date_converter.dart';
import 'package:dinolog_app/model/data/log_entries.dart';
import 'package:dinolog_app/model/sources/dinolog_api.dart';

class LogRepository {
  LogRepository(this._api);

  final DinologApi _api;

  Future<LogEntries> getLogEntries(DateTime from, DateTime to) async {
    final fromString = formatRfc3339DateTime(from);
    final toString = formatRfc3339DateTime(to);
    return await _api.getLogEntries(fromString, toString);
  }
}
