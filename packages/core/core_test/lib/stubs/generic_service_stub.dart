// ignore_for_file: depend_on_referenced_packages

import 'package:core_dependencies/chopper.dart';
import 'package:core_dependencies/http.dart' as http;
import 'package:mocktail/mocktail.dart';

void setUpServiceResponseOf<T>(
  Future<Response<T>> Function() stubFn, {
  required T body,
  required int statusCode,
}) {
  when(stubFn).thenAnswer(
    (_) async {
      final response = Response(
        http.Response(body.toString(), statusCode),
        body,
      ).copyWith(body: body);

      return response;
    },
  );
}

void setUpServiceExceptionResponse<T>(Future<Response<T>> Function() stubFn) {
  when(stubFn).thenThrow(Exception());
}
