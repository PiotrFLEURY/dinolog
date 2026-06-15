import 'package:dinolog_app/model/data/ip_infos.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/ip_infos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class IpBar extends ConsumerWidget {
  const IpBar({
    super.key,
    required this.ip,
    required this.color,
    required this.percentage,
    required this.count,
  });

  final String ip;
  final Color color;
  final double percentage;
  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 300,
      height: 32,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
              future: ref.watch(ipInfosProvider(ip).future),
              builder: (context, asyncSnapshot) {
                return Row(
                  children: [
                    Text(
                      asyncSnapshot.data?.countryFlag ?? '',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      '(${asyncSnapshot.data?.country ?? ''})',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                );
              },
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://ipinfo.io/$ip'));
              },
              child: Text(ip, style: Theme.of(context).textTheme.labelMedium),
            ),
            SizedBox(
              width: 48,
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
        subtitle: LinearProgressIndicator(
          value: percentage / 100,
          color: color,
          backgroundColor: DinologTheme.borderStandard,
        ),
      ),
    );
  }
}
