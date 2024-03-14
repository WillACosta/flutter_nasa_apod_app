import 'package:core_dependencies/http.dart';

sealed class NetworkException extends ClientException {
  NetworkException(super.message);
}

class ApiException extends NetworkException {
  final dynamic error;

  ApiException(super.message, {required this.error});
}

class UnknownException extends NetworkException {
  UnknownException(super.message);
}
