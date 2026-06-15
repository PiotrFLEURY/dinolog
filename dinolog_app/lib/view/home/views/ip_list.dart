import 'package:dinolog_app/view/home/views/ip_bar.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/top_ip_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IpList extends ConsumerWidget {
  const IpList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(topIpProvider.future),
      builder: (context, asyncSnapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'TOP IPS CLIENTES',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Container(
              decoration: BoxDecoration(
                color: DinologTheme.cardDetailBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: DinologTheme.borderStandard),
              ),
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final topIp in asyncSnapshot.data ?? [])
                        IpBar(
                          ip: topIp.ip,
                          color: DinologTheme.accentInfo,
                          percentage:
                              (topIp.count /
                                      (asyncSnapshot.data?.first.count ?? 1) *
                                      100)
                                  .toInt(),
                          count: topIp.count,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
