import 'package:dinolog_app/model/data/log_entries.dart';
import 'package:dinolog_app/model/sources/dto/authentication_request.dart';
import 'package:dinolog_app/model/sources/dto/authentication_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'dinolog_api.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class DinologApi {
  factory DinologApi(Dio dio, {String? baseUrl}) = _DinologApi;

  @GET('/logs')
  Future<LogEntries> getLogEntries(
    @Query('from') String from,
    @Query('to') String to,
  );

  @POST('/auth/login')
  @Headers({'Content-Type': 'application/json'})
  Future<AuthenticationResponse> login(@Body() AuthenticationRequest request);
}
