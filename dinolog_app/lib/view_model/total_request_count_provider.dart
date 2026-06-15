import 'package:dinolog_app/view_model/period_logs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_request_count_provider.g.dart';

@riverpod
Future<int> totalRequestCount(Ref ref) async {
  final logEntries = await ref.watch(periodLogsProvider.future);
  return logEntries.entries.length;
}
