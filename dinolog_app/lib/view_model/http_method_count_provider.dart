import 'package:dinolog_app/view_model/period_logs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_method_count_provider.g.dart';

class HttpMethodCount {
  final Map<String, int> methodCounts;

  HttpMethodCount(this.methodCounts);

  int get totalCount =>
      methodCounts.values.fold(0, (sum, count) => sum + count);
}

bool isStandard(String method) {
  const standardMethods = {'GET', 'POST', 'PUT', 'DELETE', 'PATCH'};
  return standardMethods.contains(method);
}

@riverpod
Future<HttpMethodCount> httpMethodCount(Ref ref) async {
  final logEntries = await ref.watch(periodLogsProvider.future);
  final methodCounts = <String, int>{};

  for (final entry in logEntries.entries) {
    final method = entry.httpMethod;
    if (isStandard(method)) {
      methodCounts[method] = (methodCounts[method] ?? 0) + 1;
    } else {
      methodCounts['OTHER'] = (methodCounts['OTHER'] ?? 0) + 1;
    }
  }

  return HttpMethodCount(methodCounts);
}
