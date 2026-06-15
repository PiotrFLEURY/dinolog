import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_period_provider.g.dart';

@riverpod
class SelectedPeriod extends _$SelectedPeriod {
  @override
  SelectedPeriodEnum build() {
    return SelectedPeriodEnum.twentyFourHours;
  }

  void setSelectedPeriod(SelectedPeriodEnum period) {
    state = period;
  }
}

enum SelectedPeriodEnum {
  oneHour,
  sixHours,
  twentyFourHours,
  threeDays,
  sevenDays;

  String get label {
    switch (this) {
      case SelectedPeriodEnum.oneHour:
        return '1h';
      case SelectedPeriodEnum.sixHours:
        return '6h';
      case SelectedPeriodEnum.twentyFourHours:
        return '24h';
      case SelectedPeriodEnum.threeDays:
        return '3j';
      case SelectedPeriodEnum.sevenDays:
        return '7j';
    }
  }
}
