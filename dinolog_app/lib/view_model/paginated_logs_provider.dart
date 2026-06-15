import 'package:dinolog_app/model/data/log_entry.dart';
import 'package:dinolog_app/view_model/period_logs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_logs_provider.g.dart';

bool _matchStatusFilter(LogEntry entry, String? status) {
  if (status == null) return true;
  switch (status) {
    case '2xx':
      return entry.statusCodeAsInt >= 200 && entry.statusCodeAsInt < 300;
    case '3xx':
      return entry.statusCodeAsInt >= 300 && entry.statusCodeAsInt < 400;
    case '4xx':
      return entry.statusCodeAsInt >= 400 && entry.statusCodeAsInt < 500;
    case '5xx':
      return entry.statusCodeAsInt >= 500 && entry.statusCodeAsInt < 600;
    default:
      return true;
  }
}

bool _matchMethodFilter(LogEntry entry, String? method) {
  if (method == null) return true;
  return entry.httpMethod.toLowerCase() == method.toLowerCase();
}

@riverpod
Future<PaginatedLogs> paginatedLogs(
  Ref ref, {
  required int page,
  required int pageSize,
  required String? status,
  required String? method,
}) async {
  final logEntries = await ref.watch(periodLogsProvider.future);
  final filteredEntries = logEntries.entries.where((entry) {
    final statusMatches = _matchStatusFilter(entry, status);
    final methodMatches = _matchMethodFilter(entry, method);
    return statusMatches && methodMatches;
  }).toList();
  final startIndex = (page - 1) * pageSize;
  final endIndex = startIndex + pageSize;
  final paginatedEntries = filteredEntries.sublist(
    startIndex,
    endIndex > filteredEntries.length ? filteredEntries.length : endIndex,
  );
  return PaginatedLogs(
    page: page,
    pageSize: pageSize,
    totalEntries: filteredEntries.length,
    totalPages: (filteredEntries.length / pageSize).ceil(),
    entries: paginatedEntries,
  );
}

class PaginatedLogs {
  int page;
  int pageSize;
  int totalEntries;
  int totalPages;
  List<LogEntry> entries;

  PaginatedLogs({
    required this.page,
    required this.pageSize,
    required this.totalEntries,
    required this.totalPages,
    required this.entries,
  });
}
