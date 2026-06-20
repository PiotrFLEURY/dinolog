import 'dart:convert';

import 'package:dinolog_app/view_model/preferences_provider.dart';
import 'package:dinolog_app/view_model/stored_token_provider.dart';
import 'package:dinolog_app/view_model/token_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

class AuthState {
  const AuthState({this.token, this.isLoading = false, this.error});

  final String? token;
  final bool isLoading;
  final String? error;

  bool get isAuthenticated => token != null;

  AuthState copyWith({
    String? token,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return AuthState(
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

@riverpod
class Auth extends _$Auth {
  @override
  Future<AuthState> build() async {
    final stored = await ref.watch(storedTokenProvider.future);
    if (stored != null && _isTokenValid(stored)) {
      return AuthState(token: stored);
    }
    return const AuthState();
  }

  Future<void> login(String username, String password) async {
    final currentState = state.value ?? const AuthState();
    state = AsyncValue.data(
      currentState.copyWith(isLoading: true, clearError: true),
    );
    try {
      final tokenRepo = await ref.read(tokenRepositoryProvider.future);
      final preferences = await ref.read(preferencesProvider.future);

      final token = await tokenRepo.login(username, password);
      preferences.setString(PreferencesConstants.tokenKey, token);
      ref.invalidate(storedTokenProvider);
      state = AsyncValue.data(AuthState(token: token));
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Login failed: $e');
      }
      state = AsyncValue.data(
        currentState.copyWith(isLoading: false, error: 'Invalid credentials'),
      );
    }
  }

  Future<void> logout() async {
    final preferences = await ref.read(preferencesProvider.future);
    preferences.remove(PreferencesConstants.tokenKey);
    state = AsyncValue.data(const AuthState());
  }

  bool _isTokenValid(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return false;
      final payload = base64.normalize(parts[1]);
      final data =
          jsonDecode(utf8.decode(base64Url.decode(payload)))
              as Map<String, dynamic>;
      final exp = data['exp'] as int?;
      if (exp == null) return false;
      return DateTime.now().millisecondsSinceEpoch < exp * 1000;
    } catch (_) {
      return false;
    }
  }
}
