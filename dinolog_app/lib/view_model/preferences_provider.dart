import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_provider.g.dart';

class PreferencesConstants {
  static const tokenKey = 'dinolog_token';
}

@riverpod
Future<SharedPreferences> preferences(Ref ref) {
  return SharedPreferences.getInstance();
}
