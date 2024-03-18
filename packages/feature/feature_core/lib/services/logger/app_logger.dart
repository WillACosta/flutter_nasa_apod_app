import 'package:core_dependencies/logging.dart';

enum AppLoggerLevels { severe, warning, info, config, fine }

class AppLogger {
  AppLogger(String logTag) {
    _logger = Logger(logTag);
  }

  late Logger _logger;

  void severe(Object? message, [Object? error, StackTrace? st]) =>
      _logger.severe(message, error, st);

  void warning(Object? message, [Object? error, StackTrace? st]) =>
      _logger.warning(message, error, st);

  void info(Object? message, [Object? error, StackTrace? st]) =>
      _logger.info(message, error, st);

  void config(Object? message, [Object? error, StackTrace? st]) =>
      _logger.config(message, error, st);

  void fine(Object? message, [Object? error, StackTrace? st]) =>
      _logger.fine(message, error, st);
}
