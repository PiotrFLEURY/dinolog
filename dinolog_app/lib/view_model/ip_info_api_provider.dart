import 'package:dinolog_app/model/sources/ip_info_api.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ip_info_api_provider.g.dart';

@riverpod
IpInfoApi ipInfoApi(Ref ref) {
  final dio = Dio();
  return IpInfoApi(dio);
}
