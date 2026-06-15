import 'package:dinolog_app/view/home/views/http_method_bar.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/http_method_count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HttpMethodList extends ConsumerWidget {
  const HttpMethodList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(httpMethodCountProvider.future),
      builder: (context, asyncSnapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'METHODES HTTP',
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
                      if (asyncSnapshot.hasData)
                        ...asyncSnapshot.data!.methodCounts.entries.map((
                          entry,
                        ) {
                          final method = entry.key;
                          final count = entry.value;
                          final percentage = asyncSnapshot.data!.totalCount > 0
                              ? (count / asyncSnapshot.data!.totalCount) * 100
                              : 0.0;

                          Color color;
                          switch (method) {
                            case 'GET':
                              color = DinologTheme.accentSuccess;
                              break;
                            case 'POST':
                              color = DinologTheme.accentInfo;
                              break;
                            case 'PUT':
                              color = DinologTheme.accentWarning;
                              break;
                            case 'DELETE':
                              color = DinologTheme.accentError;
                              break;
                            default:
                              color = DinologTheme.accentInfo;
                          }

                          return HttpMethodBar(
                            method: method,
                            color: color,
                            percentage: percentage,
                            count: count,
                          );
                        }),
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
