import 'package:dinolog_app/view/home/views/chart_legend.dart';
import 'package:dinolog_app/view/home/views/timeline_provider.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestsTimeline extends ConsumerWidget {
  const RequestsTimeline({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VOLUME DE REQUÊTES - TIMELINE',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: DinologTheme.cardDetailBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: DinologTheme.borderStandard),
          ),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  ChartLegend(
                    color: DinologTheme.accentSuccess,
                    label: 'Succès',
                  ),
                  ChartLegend(color: DinologTheme.accentError, label: 'Erreur'),
                ],
              ),
              SizedBox(
                height: 150,
                child: FutureBuilder<Timeline>(
                  future: ref.watch(timelineProvider.future),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: Text('No data available'));
                    }
                    final timeline = snapshot.data!;
                    return LineChart(
                      LineChartData(
                        lineBarsData: [
                          // Succes line
                          LineChartBarData(
                            spots: timeline.spots.values.indexed.map<FlSpot>((
                              entry,
                            ) {
                              return FlSpot(
                                entry.$1.toDouble(),
                                entry.$2.successCount.toDouble(),
                              );
                            }).toList(),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors:
                                    [
                                          DinologTheme.accentSuccess,
                                          DinologTheme.accentSuccess.withAlpha(
                                            0,
                                          ),
                                        ]
                                        .map(
                                          (color) =>
                                              color.withValues(alpha: 0.3),
                                        )
                                        .toList(),
                              ),
                            ),
                            isCurved: true,
                            barWidth: 2,
                            color: DinologTheme.accentSuccess,
                          ),
                          // Error line
                          LineChartBarData(
                            spots: timeline.spots.values.indexed.map<FlSpot>((
                              entry,
                            ) {
                              return FlSpot(
                                entry.$1.toDouble(),
                                entry.$2.errorCount.toDouble(),
                              );
                            }).toList(),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors:
                                    [
                                          DinologTheme.accentError,
                                          DinologTheme.accentError.withAlpha(0),
                                        ]
                                        .map(
                                          (color) =>
                                              color.withValues(alpha: 0.3),
                                        )
                                        .toList(),
                              ),
                            ),
                            isCurved: true,
                            barWidth: 2,
                            color: DinologTheme.accentError,
                          ),
                        ],
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(drawVerticalLine: false),
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                final index = value.toInt();
                                if (index < 0 ||
                                    index >= timeline.spots.length) {
                                  return const SizedBox.shrink();
                                }
                                final timestamp = timeline.spots.keys.elementAt(
                                  index,
                                );
                                if (timestamp.hour == 0 &&
                                    timestamp.minute == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      '${timestamp.year}-${timestamp.month.toString().padLeft(2, '0')}-${timestamp.day.toString().padLeft(2, '0')}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: DinologTheme.textPrimary,
                                          ),
                                    ),
                                  );
                                }
                                final formattedTime =
                                    '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    formattedTime,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelSmall,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
