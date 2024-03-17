import 'dart:io';

import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/chopper.dart';
import 'package:core_dependencies/result.dart';

Future<Result<T, AppFailure>> safeApiCall<T extends Object>(
  Future<Response<T>> Function() apiCallback,
) async {
  try {
    final response = await apiCallback();
    final isSuccess = response.isSuccessful;

    if (isSuccess) {
      final body = response.body;
      return successOf(body as T);
    }

    return failureOf(UnexpectedFailure());
  } on SocketException catch (e) {
    return failureOf(NoConnectionFailure());
  } catch (e) {
    return failureOf(UnexpectedFailure());
  }
}
