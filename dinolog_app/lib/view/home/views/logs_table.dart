import 'package:dinolog_app/model/data/ip_infos.dart';
import 'package:dinolog_app/model/data/log_entry.dart';
import 'package:dinolog_app/view/home/views/logs_filter.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/ip_infos_provider.dart';
import 'package:dinolog_app/view_model/paginated_logs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class LogsTable extends ConsumerStatefulWidget {
  const LogsTable({super.key});

  @override
  ConsumerState<LogsTable> createState() => _LogsTableState();
}

class _LogsTableState extends ConsumerState<LogsTable> {
  int page = 1;
  int pageSize = 10;
  String? statusFilter;
  String? methodFilter;

  void _nextPage() {
    setState(() {
      page++;
    });
  }

  void _previousPage() {
    setState(() {
      if (page > 1) {
        page--;
      }
    });
  }

  void _setStatusFilter(String? status) {
    setState(() {
      statusFilter = status;
      page = 1; // Reset to first page when filter changes
    });
  }

  void _setMethodFilter(String? method) {
    setState(() {
      methodFilter = method;
      page = 1; // Reset to first page when filter changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.watch(
        paginatedLogsProvider(
          page: page,
          pageSize: pageSize,
          status: statusFilter,
          method: methodFilter,
        ).future,
      ),
      builder: (context, asyncSnapshot) {
        return Column(
          spacing: 8.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'JOURNAL DES REQUÊTES - ${asyncSnapshot.data?.totalEntries ?? 0} ENTREES',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            LogsFilter(
              onStatusFilterChanged: _setStatusFilter,
              onMethodFilterChanged: _setMethodFilter,
            ),
            MediaQuery.of(context).size.width < 600
                ? _buildList(context, asyncSnapshot)
                : _buildTable(context, asyncSnapshot),
          ],
        );
      },
    );
  }

  Container _buildList(
    BuildContext context,
    AsyncSnapshot<PaginatedLogs> asyncSnapshot,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: DinologTheme.cardDetailBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DinologTheme.borderStandard),
      ),
      child: Column(
        spacing: 8.0,
        children: [
          for (final LogEntry logEntry in asyncSnapshot.data?.entries ?? [])
            ListTile(
              onTap: () {
                launchUrl(
                  Uri.parse('https://ipinfo.io/${logEntry.remoteAddr}'),
                );
              },
              leading: Text(
                logEntry.httpMethod,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: DinologTheme.accentSuccess,
                ),
              ),
              title: Text(
                logEntry.requestPath,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall!.copyWith(color: DinologTheme.textTitle),
              ),
              subtitle: Text(
                logEntry.timeLocal.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              trailing: Text(
                logEntry.statusCode,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: _getStatusColor(logEntry.statusCodeAsInt),
                ),
              ),
            ),
          _buildPaginationButtons(asyncSnapshot, context),
        ],
      ),
    );
  }

  Container _buildTable(
    BuildContext context,
    AsyncSnapshot<PaginatedLogs> asyncSnapshot,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: DinologTheme.cardDetailBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DinologTheme.borderStandard),
      ),
      child: Column(
        spacing: 8.0,
        children: [
          Table(
            defaultVerticalAlignment: .middle,
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: DinologTheme.backgroundSecondary,
                ),
                children: [
                  SizedBox(height: 48, width: 8),
                  Text(
                    'HORODATAGE',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text('IP', style: Theme.of(context).textTheme.labelSmall),
                  Text(
                    'METHODE',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    'ENDPOINT',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text('STATUT', style: Theme.of(context).textTheme.labelSmall),
                  Text(
                    'REFERER',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    'USER AGENT',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),

              // ---- DATA
              for (final LogEntry logEntry in asyncSnapshot.data?.entries ?? [])
                TableRow(
                  children: [
                    SizedBox(height: 48),
                    Text(
                      logEntry.timeLocal.toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(
                          Uri.parse('https://ipinfo.io/${logEntry.remoteAddr}'),
                        );
                      },
                      child: FutureBuilder(
                        future: ref.watch(
                          ipInfosProvider(logEntry.remoteAddr).future,
                        ),
                        builder: (context, asyncSnapshot) {
                          return Row(
                            children: [
                              Text(
                                asyncSnapshot.data?.countryFlag ?? '',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              Text(
                                "(${asyncSnapshot.data?.country ?? ''})",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              Text(
                                logEntry.remoteAddr,
                                style: Theme.of(context).textTheme.labelSmall!
                                    .copyWith(color: DinologTheme.textTitle),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Text(
                      logEntry.httpMethod,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: DinologTheme.accentSuccess,
                      ),
                    ),
                    Text(
                      logEntry.requestPath,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: DinologTheme.textTitle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: DinologTheme.accentSuccess.withAlpha(50),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          logEntry.statusCode,
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                color: _getStatusColor(
                                  logEntry.statusCodeAsInt,
                                ),
                              ),
                        ),
                      ),
                    ),
                    Text(
                      logEntry.httpReferer,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: DinologTheme.accentSuccess,
                      ),
                    ),
                    Text(
                      logEntry.httpUserAgent,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
            ],
          ),
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: const RequestDetails(),
          //   ),
          // ),
          Divider(),
          _buildPaginationButtons(asyncSnapshot, context),
        ],
      ),
    );
  }

  Padding _buildPaginationButtons(
    AsyncSnapshot<PaginatedLogs> asyncSnapshot,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'Page $page / ${asyncSnapshot.data?.totalPages ?? 1}',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              _previousPage();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
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
              'Préc',
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: DinologTheme.textPrimary),
            ),
          ),
          SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: () {
              if (page < (asyncSnapshot.data?.totalPages ?? 1)) {
                _nextPage();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              'Suiv',
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: DinologTheme.textPrimary),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(int code) {
    if (code >= 200 && code < 300) {
      return DinologTheme.accentSuccess;
    } else if (code >= 300 && code < 400) {
      return DinologTheme.accentInfo;
    } else if (code >= 400 && code < 500) {
      return DinologTheme.accentWarning;
    } else if (code >= 500 && code < 600) {
      return DinologTheme.accentError;
    } else {
      return DinologTheme.textTitle;
    }
  }
}
