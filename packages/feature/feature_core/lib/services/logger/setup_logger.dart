// ignore_for_file: avoid_print

import 'package:core_dependencies/logging.dart';

void setupLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  Logger.root.info('Logger initialized.');
}
