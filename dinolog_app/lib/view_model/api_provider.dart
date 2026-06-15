import 'package:dinolog_app/model/sources/dinolog_api.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart';

@riverpod
DinologApi dinologApi(Ref ref) {
  final dio = Dio();
  const baseUrl = String.fromEnvironment(
    'DINOLG_API_BASE_URL',
    defaultValue: 'http://localhost:3000',
  );
  return DinologApi(dio, baseUrl: baseUrl);
}
