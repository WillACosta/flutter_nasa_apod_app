// ignore_for_file: depend_on_referenced_packages

import 'package:mocktail/mocktail.dart';

abstract interface class TestFunctions {
  static void registerFallBackValues(List<dynamic> values) {
    for (dynamic value in values) {
      registerFallbackValue(value);
    }
  }
}
