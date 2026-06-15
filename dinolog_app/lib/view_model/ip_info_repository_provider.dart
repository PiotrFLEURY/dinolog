import 'package:dinolog_app/model/repositories/ip_infos_repository.dart';
import 'package:dinolog_app/view_model/ip_info_api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ip_info_repository_provider.g.dart';

@riverpod
IpInfosRepository ipInfosRepository(Ref ref) {
  final api = ref.watch(ipInfoApiProvider);
  return IpInfosRepository(api);
}
