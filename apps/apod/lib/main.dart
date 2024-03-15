import 'package:flutter/material.dart';
import 'package:ui_media/ui_media.dart';

void main() {
  runApp(const ApodApp());
}

class ApodApp extends StatelessWidget {
  const ApodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APOD App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MediaGalleryView(),
    );
  }
}

