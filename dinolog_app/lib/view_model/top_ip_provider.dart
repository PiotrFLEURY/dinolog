import 'package:dinolog_app/view_model/period_logs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_ip_provider.g.dart';

@riverpod
Future<List<TopIp>> topIp(Ref ref) async {
  final logEntries = await ref.watch(periodLogsProvider.future);
  final ipCounts = <String, int>{};

  for (final entry in logEntries.entries) {
    ipCounts[entry.remoteAddr] = (ipCounts[entry.remoteAddr] ?? 0) + 1;
  }

  final topIps =
      ipCounts.entries.map((e) => TopIp(ip: e.key, count: e.value)).toList()
        ..sort((a, b) => b.count.compareTo(a.count));

  return topIps.take(5).toList();
}

class TopIp {
  final String ip;
  final int count;

  TopIp({required this.ip, required this.count});
}
