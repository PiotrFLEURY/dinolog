import 'package:dinolog_app/model/data/ip_infos.dart';
import 'package:dinolog_app/view_model/ip_info_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ip_infos_provider.g.dart';

@riverpod
Future<IpInfos> ipInfos(Ref ref, String ip) async {
  final repository = ref.watch(ipInfosRepositoryProvider);
  return repository.getIpInfos(ip);
}
