import 'package:dinolog_app/model/data/log_entry.dart';
import 'package:dinolog_app/view_model/period_logs_provider.dart';
import 'package:dinolog_app/view_model/selected_period_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timeline_provider.g.dart';

class TimelineCount {
  final int successCount;
  final int errorCount;

  TimelineCount(this.successCount, this.errorCount);
}

class Timeline {
  Map<DateTime, TimelineCount> spots = {};
}

@riverpod
Future<Timeline> timeline(Ref ref) async {
  final selectedPeriod = ref.watch(selectedPeriodProvider);
  final logEntries = await ref.watch(periodLogsProvider.future);
  final timeline = Timeline();
  for (var entry in logEntries.entries) {
    final time = entry.timeLocal;
    final minute = getTimeUnitForSelectedPeriod(selectedPeriod, time);
    final count = timeline.spots[minute] ?? TimelineCount(0, 0);
    if (entry.statusCodeAsInt >= 200 && entry.statusCodeAsInt < 300) {
      timeline.spots[minute] = TimelineCount(
        count.successCount + 1,
        count.errorCount,
      );
    } else if (entry.statusCodeAsInt >= 400) {
      timeline.spots[minute] = TimelineCount(
        count.successCount,
        count.errorCount + 1,
      );
    }
  }
  return timeline;
}

DateTime getTimeUnitForSelectedPeriod(
  SelectedPeriodEnum selectedPeriod,
  DateTime entryTime,
) {
  switch (selectedPeriod) {
    case SelectedPeriodEnum.oneHour:
      return DateTime(
        entryTime.year,
        entryTime.month,
        entryTime.day,
        entryTime.hour,
        entryTime.minute,
      );
    case SelectedPeriodEnum.sixHours:
      return DateTime(
        entryTime.year,
        entryTime.month,
        entryTime.day,
        entryTime.hour,
      );
    case SelectedPeriodEnum.twentyFourHours:
      return DateTime(
        entryTime.year,
        entryTime.month,
        entryTime.day,
        entryTime.hour,
      );
    case SelectedPeriodEnum.threeDays:
      return DateTime(
        entryTime.year,
        entryTime.month,
        entryTime.day,
        entryTime.hour,
      );
    case SelectedPeriodEnum.sevenDays:
      return DateTime(
        entryTime.year,
        entryTime.month,
        entryTime.day,
        entryTime.hour,
      );
  }
}
