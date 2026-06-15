import 'package:dinolog_app/view_model/period_logs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_endpoints_provider.g.dart';

@riverpod
Future<List<TopEndpoint>> topEndpoints(Ref ref) async {
  final logEntries = await ref.watch(periodLogsProvider.future);
  final endpointCounts = <String, int>{};

  for (final entry in logEntries.entries) {
    endpointCounts[entry.requestPath] =
        (endpointCounts[entry.requestPath] ?? 0) + 1;
  }

  final topEndpoints =
      endpointCounts.entries
          .map((e) => TopEndpoint(endpoint: e.key, count: e.value))
          .toList()
        ..sort((a, b) => b.count.compareTo(a.count));

  return topEndpoints.take(5).toList();
}

class TopEndpoint {
  final String endpoint;
  final int count;

  TopEndpoint({required this.endpoint, required this.count});
}
