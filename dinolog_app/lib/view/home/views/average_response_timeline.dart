import 'package:dinolog_app/view/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AverageResponseTimeline extends StatelessWidget {
  const AverageResponseTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TEMPS DE RÉPONSE MOYEN - MS',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: DinologTheme.cardDetailBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: DinologTheme.borderStandard),
          ),
          child: SizedBox(
            height: 100,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 200),
                      FlSpot(6, 220),
                      FlSpot(12, 230),
                      FlSpot(18, 210),
                      FlSpot(24, 215),
                    ],
                    isCurved: true,
                    barWidth: 2,
                    color: DinologTheme.accentInfo,
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
                      getTitlesWidget: (value, meta) {
                        if (value % 6 == 0) {
                          return Text(
                            '${value.toInt()}h',
                            style: Theme.of(context).textTheme.labelSmall,
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
