import 'dart:async';

import 'package:core_dependencies/chopper.dart';

class ApiInterceptor implements RequestInterceptor {
  final _apiKey = const String.fromEnvironment("APOD_API_KEY");

  @override
  FutureOr<Request> onRequest(Request request) {
    final requestParams = request.parameters;
    requestParams.addAll({'api_key': _apiKey});

    return request.copyWith(parameters: requestParams);
  }
}
