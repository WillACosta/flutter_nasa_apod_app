import 'dart:io';

import 'package:core_dependencies/internet_connection_checker.dart';

class NetworkActivityService {
  Future<bool> hasConnection() async {
    try {
      return await InternetConnectionChecker().hasConnection;
    } on SocketException {
      return false;
    }
  }
}
