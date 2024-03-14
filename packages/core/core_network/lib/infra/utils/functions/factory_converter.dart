import 'dart:convert';

import 'package:core_dependencies/chopper.dart';

Response<T> factoryConverter<T>(
  Response res,
  T Function(dynamic source) mapFunction,
) {
  final decodeBody = jsonDecode(res.body);
  final response = mapFunction(decodeBody);

  return res.copyWith(body: response);
}
