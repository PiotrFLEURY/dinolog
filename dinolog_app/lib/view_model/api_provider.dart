import 'package:dinolog_app/model/sources/dinolog_api.dart';
import 'package:dinolog_app/view_model/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart';

@riverpod
Future<DinologApi> dinologApi(Ref ref) async {
  final dio = await ref.watch(customDioProvider.future);

  const baseUrl = String.fromEnvironment(
    'DINOLG_API_BASE_URL',
    defaultValue: 'http://localhost:3000',
  );
  return DinologApi(dio, baseUrl: baseUrl);
}
