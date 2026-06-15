import 'package:dinolog_app/view/home/views/chart_legend.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/status_code_repartition_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusDistribution extends ConsumerWidget {
  const StatusDistribution({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'REPARTITION DES STATUTS HTTP',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Container(
          decoration: BoxDecoration(
            color: DinologTheme.cardDetailBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: DinologTheme.borderStandard),
          ),
          child: SizedBox(
            width: 200,
            height: 200,
            child: FutureBuilder(
              future: ref.watch(statusCodeRepartitionProvider.future),
              builder: (context, asyncSnapshot) {
                final statusCodeRepartition = asyncSnapshot.data;
                if (statusCodeRepartition == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: DinologTheme.accentSuccess,
                            value: statusCodeRepartition.successCount
                                .toDouble(),
                            radius: 20,
                            showTitle: false,
                            titleStyle: Theme.of(context).textTheme.labelSmall,
                          ),
                          PieChartSectionData(
                            color: DinologTheme.accentWarning,
                            value: statusCodeRepartition.clientErrorCount
                                .toDouble(),
                            radius: 20,
                            showTitle: false,
                            titleStyle: Theme.of(context).textTheme.labelSmall,
                          ),
                          PieChartSectionData(
                            color: DinologTheme.accentError,
                            value: statusCodeRepartition.serverErrorCount
                                .toDouble(),
                            radius: 20,
                            showTitle: false,
                            titleStyle: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                        sectionsSpace: 0,
                        centerSpaceRadius: 50,
                        borderData: FlBorderData(show: false),
                        startDegreeOffset: -90,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${statusCodeRepartition.successPercentage}%',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'succès',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 16,
                      child: Row(
                        children: [
                          ChartLegend(
                            color: DinologTheme.accentSuccess,
                            label: '2xx',
                          ),
                          SizedBox(width: 8),
                          ChartLegend(
                            color: DinologTheme.accentWarning,
                            label: '4xx',
                          ),
                          SizedBox(width: 8),
                          ChartLegend(
                            color: DinologTheme.accentError,
                            label: '5xx',
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
