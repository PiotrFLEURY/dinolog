import 'package:dinolog_app/model/sources/dinolog_api.dart';
import 'package:dinolog_app/model/sources/dto/authentication_request.dart';

class TokenRepository {
  TokenRepository(this._api);

  final DinologApi _api;

  Future<String> login(String username, String password) async {
    final request = AuthenticationRequest(
      username: username,
      password: password,
    );
    final response = await _api.login(request);
    return response.token;
  }
}
