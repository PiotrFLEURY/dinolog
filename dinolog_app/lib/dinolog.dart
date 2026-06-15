import 'package:dinolog_app/view/home/home_page.dart';
import 'package:dinolog_app/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dinolog extends StatelessWidget {
  const Dinolog({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      retry: (retryCount, error) => null,
      child: MaterialApp(
        title: 'DinoLog',
        theme: dinologThemeData(),
        home: const HomePage(),
      ),
    );
  }
}
