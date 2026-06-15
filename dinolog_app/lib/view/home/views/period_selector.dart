import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/selected_period_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeriodSelector extends ConsumerWidget {
  const PeriodSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPeriod = ref.watch(selectedPeriodProvider);
    return Row(
      children: [
        Text('PERIODE', style: Theme.of(context).textTheme.labelSmall),
        ...SelectedPeriodEnum.values.map((period) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              onPressed: () {
                ref
                    .read(selectedPeriodProvider.notifier)
                    .setSelectedPeriod(period);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedPeriod == period
                    ? DinologTheme.accentSuccess
                    : Colors.transparent,
                foregroundColor: selectedPeriod == period
                    ? DinologTheme.textLabel
                    : Theme.of(context).colorScheme.onSurface,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: Text(
                period.label,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          );
        }),
      ],
    );
  }
}
