import 'package:dinolog_app/model/data/ip_infos.dart';
import 'package:dinolog_app/model/sources/ip_info_api.dart';

class IpInfosRepository {
  final IpInfoApi _api;

  IpInfosRepository(this._api);

  Future<IpInfos> getIpInfos(String ip) async {
    return await _api.getIpInfos(ip);
  }
}
