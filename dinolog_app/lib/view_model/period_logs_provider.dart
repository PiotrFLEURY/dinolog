import 'package:dinolog_app/model/data/log_entries.dart';
import 'package:dinolog_app/view_model/log_repository_provider.dart';
import 'package:dinolog_app/view_model/selected_period_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'period_logs_provider.g.dart';

@riverpod
Future<LogEntries> periodLogs(Ref ref) async {
  final selectedPeriod = ref.watch(selectedPeriodProvider);
  final repository = ref.watch(logRepositoryProvider);
  final from = maxPeriodStartTime(selectedPeriod);
  final to = DateTime.now();
  return repository.getLogEntries(from, to);
}

DateTime maxPeriodStartTime(SelectedPeriodEnum selectedPeriod) {
  final now = DateTime.now();
  switch (selectedPeriod) {
    case SelectedPeriodEnum.oneHour:
      return now.subtract(const Duration(hours: 1));
    case SelectedPeriodEnum.sixHours:
      return now.subtract(const Duration(hours: 6));
    case SelectedPeriodEnum.twentyFourHours:
      return now.subtract(const Duration(hours: 24));
    case SelectedPeriodEnum.threeDays:
      return now.subtract(const Duration(days: 3));
    case SelectedPeriodEnum.sevenDays:
      return now.subtract(const Duration(days: 7));
  }
}
