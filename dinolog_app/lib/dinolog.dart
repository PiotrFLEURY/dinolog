import 'package:dinolog_app/view/home/home_page.dart';
import 'package:dinolog_app/view/login/login_page.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:dinolog_app/view_model/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dinolog extends StatelessWidget {
  const Dinolog({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      retry: (retryCount, error) => null,
      child: const _DinologApp(),
    );
  }
}

class _DinologApp extends ConsumerWidget {
  const _DinologApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'DinoLog',
      theme: dinologThemeData(),
      home: FutureBuilder(
        future: ref.watch(authProvider.future),
        builder: (context, snapshot) {
          final auth = snapshot.data;
          return auth?.isAuthenticated == true
              ? const HomePage()
              : const LoginPage();
        },
      ),
    );
  }
}
