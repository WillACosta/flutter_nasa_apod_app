import 'package:core_dependencies/chopper.dart';

import '../interceptors/api_interceptor.dart';

final class HttpClientApp extends ChopperClient {
  static const _baseUrl = String.fromEnvironment("APOD_BASE_URL");

  HttpClientApp()
      : super(
          baseUrl: Uri.parse(_baseUrl),
          interceptors: [
            HttpLoggingInterceptor(level: Level.body),
            ApiInterceptor()
          ],
        );
}
