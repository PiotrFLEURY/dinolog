import 'package:dinolog_app/model/repositories/log_repository.dart';
import 'package:dinolog_app/view_model/api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_repository_provider.g.dart';

@riverpod
LogRepository logRepository(Ref ref) {
  final api = ref.watch(dinologApiProvider);
  return LogRepository(api);
}
