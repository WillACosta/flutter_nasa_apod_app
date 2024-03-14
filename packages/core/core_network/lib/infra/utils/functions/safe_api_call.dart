import 'dart:convert';

import 'package:core_dependencies/chopper.dart';

import '../exceptions/exceptions.dart';

Future<T> safeNetworkApiCall<T>(
  Future<Response> Function() apiCallback,
  T Function(dynamic source) mapFunction,
) async {
  try {
    final response = await apiCallback();
    final isSuccess = response.isSuccessful;

    if (isSuccess) {
      final body = response.body;
      final decodedBody = body is Map ? body : jsonDecode(body);
      final value = mapFunction(decodedBody);

      return value;
    }

    throw ApiException('Application Error', error: response.body);
  } on ApiException {
    rethrow;
  } catch (e) {
    throw UnknownException(e.toString());
  }
}
