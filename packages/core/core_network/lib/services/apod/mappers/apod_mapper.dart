import 'dart:convert';

import 'package:core_dependencies/chopper.dart';
import 'package:core_network/services/apod/apod.dart';

Response<NetworkMedia> mapResponseToNetworkMedia(Response res) {
  final decodeBody = jsonDecode(res.body as String);
  final response = NetworkMedia.fromMap(
    decodeBody as Map<String, dynamic>,
  );

  return res.copyWith(body: response);
}

Response<List<NetworkMedia>> mapResponseToListNetworkMedia(Response res) {
  final decodeBody = jsonDecode(res.body as String);
  final response = NetworkMedia.fromList(decodeBody);

  return res.copyWith(body: response);
}
