import 'package:dinolog_app/model/repositories/token_repository.dart';
import 'package:dinolog_app/view_model/api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_repository_provider.g.dart';

@riverpod
Future<TokenRepository> tokenRepository(Ref ref) async {
  final api = await ref.watch(dinologApiProvider.future);
  return TokenRepository(api);
}
