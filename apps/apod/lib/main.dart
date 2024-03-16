import 'package:apod/app.dart';
import 'package:apod/config/app_modules.dart';
import 'package:core_dependencies/flutter_modular.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    ModularApp(module: AppModule(), child: const ApodApp()),
  );
}
