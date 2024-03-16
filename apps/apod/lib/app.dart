import 'package:core_dependencies/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class ApodApp extends StatelessWidget {
  const ApodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Apod App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: AppColorScheme.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: AppColorScheme.dark,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
