import 'package:dinolog_app/model/data/log_entry.dart';
import 'package:dinolog_app/view_model/period_logs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'success_ratio_provider.g.dart';

class SuccessRatio {
  SuccessRatio({required this.percentage, required this.successCount});
  double percentage;
  int successCount;
}

@riverpod
Future<SuccessRatio> successRatio(Ref ref) async {
  final logEntries = await ref.watch(periodLogsProvider.future);
  final totalCount = logEntries.entries.length;
  final successCount = logEntries.entries
      .where(
        (entry) => entry.statusCodeAsInt >= 200 && entry.statusCodeAsInt < 300,
      )
      .length;
  final percentage = totalCount > 0 ? (successCount / totalCount) * 100 : 0.0;
  return SuccessRatio(percentage: percentage, successCount: successCount);
}
