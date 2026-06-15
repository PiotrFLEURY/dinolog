import 'package:dinolog_app/model/data/ip_infos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'ip_info_api.g.dart';

@RestApi(baseUrl: 'https://ipinfo.io')
abstract class IpInfoApi {
  factory IpInfoApi(Dio dio, {String? baseUrl}) = _IpInfoApi;

  @GET('/{ip}/json')
  Future<IpInfos> getIpInfos(@Path("ip") String ip);
}
