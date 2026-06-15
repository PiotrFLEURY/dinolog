import 'package:dinolog_app/model/data/log_entry.dart';
import 'package:dinolog_app/view_model/period_logs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'status_code_repartition_provider.g.dart';

class StatusCodeRepartition {
  final int successCount;
  final int clientErrorCount;
  final int serverErrorCount;

  StatusCodeRepartition(
    this.successCount,
    this.clientErrorCount,
    this.serverErrorCount,
  );

  double get successPercentage {
    final total = successCount + clientErrorCount + serverErrorCount;
    if (total == 0) return 0;
    return double.parse((successCount / total * 100).toStringAsFixed(1));
  }
}

@riverpod
Future<StatusCodeRepartition> statusCodeRepartition(Ref ref) async {
  final logEntries = await ref.watch(periodLogsProvider.future);

  final successCount = logEntries.entries
      .where(
        (entry) => entry.statusCodeAsInt >= 200 && entry.statusCodeAsInt < 300,
      )
      .length;
  final clientErrorCount = logEntries.entries
      .where(
        (entry) => entry.statusCodeAsInt >= 400 && entry.statusCodeAsInt < 500,
      )
      .length;
  final serverErrorCount = logEntries.entries
      .where((entry) => entry.statusCodeAsInt >= 500)
      .length;
  return StatusCodeRepartition(
    successCount,
    clientErrorCount,
    serverErrorCount,
  );
}
