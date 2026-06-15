import 'package:dinolog_app/view/home/views/dinolog_card.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/error_ratio_provider.dart';
import 'package:dinolog_app/view_model/selected_period_provider.dart';
import 'package:dinolog_app/view_model/success_ratio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinolog_app/view_model/total_request_count_provider.dart';

class IndicatorsCardList extends ConsumerWidget {
  const IndicatorsCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPeriod = ref.watch(selectedPeriodProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          FutureBuilder<int>(
            future: ref.watch(totalRequestCountProvider.future),
            builder: (context, snapshot) {
              return DinologCard(
                borderColor: DinologTheme.accentSuccess,
                header: 'Requêtes totales',
                content: snapshot.hasData ? snapshot.data.toString() : '...',
                footer: 'sur les ${selectedPeriod.label}',
              );
            },
          ),
          FutureBuilder<ErrorRatio>(
            future: ref.watch(errorRatioProvider.future),
            builder: (context, snapshot) {
              return DinologCard(
                borderColor: DinologTheme.accentWarning,
                header: 'Taux d\'erreur client',
                content: snapshot.hasData
                    ? '${snapshot.data!.clientErrorPercentage.toStringAsFixed(1)}%'
                    : '...',
                footer: snapshot.hasData
                    ? '${snapshot.data!.clientErrorCount} erreurs'
                    : '...',
              );
            },
          ),
          FutureBuilder<ErrorRatio>(
            future: ref.watch(errorRatioProvider.future),
            builder: (context, snapshot) {
              return DinologCard(
                borderColor: DinologTheme.accentError,
                header: 'Taux d\'erreur serveur',
                content: snapshot.hasData
                    ? '${snapshot.data!.serverErrorPercentage.toStringAsFixed(1)}%'
                    : '...',
                footer: snapshot.hasData
                    ? '${snapshot.data!.serverErrorCount} erreurs'
                    : '...',
              );
            },
          ),
          // DinologCard(
          //   borderColor: DinologTheme.accentInfo,
          //   header: 'Temps moyen',
          //   content: '284 ms',
          //   footer: 'min 22ms',
          // ),
          // DinologCard(
          //   borderColor: DinologTheme.accentWarning,
          //   header: 'Temps max',
          //   content: '7.84s',
          //   footer: 'pire réponse',
          // ),
          // DinologCard(
          //   borderColor: DinologTheme.accentNeutral,
          //   header: 'Bande passante',
          //   content: '3.2 GB',
          //   footer: 'données transférées',
          // ),
          FutureBuilder<SuccessRatio>(
            future: ref.watch(successRatioProvider.future),
            builder: (context, asyncSnapshot) {
              return DinologCard(
                borderColor: DinologTheme.accentSuccess,
                header: 'Code 2xx',
                content: asyncSnapshot.hasData
                    ? '${asyncSnapshot.data!.percentage.toStringAsFixed(1)}%'
                    : '...',
                footer: 'taux de succès',
              );
            },
          ),
        ],
      ),
    );
  }
}
