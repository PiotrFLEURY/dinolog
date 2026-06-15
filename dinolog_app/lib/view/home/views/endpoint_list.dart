import 'package:dinolog_app/view/home/views/endpoint_bar.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/top_endpoints_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EndpointList extends ConsumerWidget {
  const EndpointList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(topEndpointsProvider.future),
      builder: (context, asyncSnapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ENDPOINT LES PLUS SOLLICITES',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Container(
              decoration: BoxDecoration(
                color: DinologTheme.cardDetailBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: DinologTheme.borderStandard),
              ),
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final topEndpoint in asyncSnapshot.data ?? [])
                        EndpointBar(
                          endpoint: topEndpoint.endpoint,
                          color: DinologTheme.accentSuccess,
                          percentage:
                              (topEndpoint.count /
                                      (asyncSnapshot.data?.first.count ?? 1) *
                                      100)
                                  .toInt(),
                          count: topEndpoint.count,
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
