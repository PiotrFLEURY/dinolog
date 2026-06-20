import 'package:dinolog_app/view_model/preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stored_token_provider.g.dart';

@riverpod
Future<String?> storedToken(Ref ref) async {
  final preferences = await ref.watch(preferencesProvider.future);
  return preferences.getString(PreferencesConstants.tokenKey);
}
