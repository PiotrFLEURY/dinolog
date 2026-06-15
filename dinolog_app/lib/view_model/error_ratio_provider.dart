import 'package:dinolog_app/model/data/log_entry.dart';
import 'package:dinolog_app/view_model/period_logs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_ratio_provider.g.dart';

class ErrorRatio {
  ErrorRatio({
    required this.clientErrorPercentage,
    required this.clientErrorCount,
    required this.serverErrorPercentage,
    required this.serverErrorCount,
  });

  double clientErrorPercentage;
  int clientErrorCount;
  double serverErrorPercentage;
  int serverErrorCount;
}

@riverpod
Future<ErrorRatio> errorRatio(Ref ref) async {
  final logEntries = await ref.watch(periodLogsProvider.future);
  final totalCount = logEntries.entries.length;
  final clientErrorCount = logEntries.entries
      .where(
        (entry) => entry.statusCodeAsInt >= 400 && entry.statusCodeAsInt < 500,
      )
      .length;
  final serverErrorCount = logEntries.entries
      .where(
        (entry) => entry.statusCodeAsInt >= 500 && entry.statusCodeAsInt < 600,
      )
      .length;

  final clientErrorPercentage = totalCount > 0
      ? (clientErrorCount / totalCount) * 100
      : 0.0;
  final serverErrorPercentage = totalCount > 0
      ? (serverErrorCount / totalCount) * 100
      : 0.0;

  return ErrorRatio(
    clientErrorPercentage: clientErrorPercentage,
    clientErrorCount: clientErrorCount,
    serverErrorPercentage: serverErrorPercentage,
    serverErrorCount: serverErrorCount,
  );
}
