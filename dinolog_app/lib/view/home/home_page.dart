import 'package:dinolog_app/view/home/views/endpoint_list.dart';
import 'package:dinolog_app/view/home/views/http_method_list.dart';
import 'package:dinolog_app/view/home/views/indicators_card_list.dart';
import 'package:dinolog_app/view/home/views/ip_list.dart';
import 'package:dinolog_app/view/home/views/logs_table.dart';
import 'package:dinolog_app/view/home/views/period_selector.dart';
import 'package:dinolog_app/view/home/views/requests_timeline.dart';
import 'package:dinolog_app/view/home/views/status_distribution.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/icon/logo.png', width: 32, height: 32),
        title: Row(
          spacing: 8,
          children: [
            const Text(
              'DinoLog fouille les logs pour vous',
              style: TextStyle(color: DinologTheme.textPrimary),
            ),
            Spacer(),
            PeriodSelector(),
            Spacer(),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            IndicatorsCardList(),
            SizedBox(height: 16),
            const RequestsTimeline(),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 16,
                children: [
                  const StatusDistribution(),
                  const HttpMethodList(),
                  const IpList(),
                ],
              ),
            ),
            SizedBox(height: 16),
            EndpointList(),
            SizedBox(height: 16),
            LogsTable(),
          ],
        ),
      ),
    );
  }
}
