import 'package:dinolog_app/model/repositories/log_repository.dart';
import 'package:dinolog_app/view_model/api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_repository_provider.g.dart';

@riverpod
Future<LogRepository> logRepository(Ref ref) async {
  final api = await ref.watch(dinologApiProvider.future);
  return LogRepository(api);
}
