import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_media/ui_media.dart';

class ApodApp extends StatelessWidget {
  const ApodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const MediaGalleryView(),
    );
  }
}
