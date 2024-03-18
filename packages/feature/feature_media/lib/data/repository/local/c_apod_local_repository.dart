import 'dart:convert';

import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/result.dart';
import 'package:core_dependencies/shared_preferences.dart';
import 'package:core_network/core_network.dart';

import 'apod_local_repository.dart';

class CApodLocalRepository implements ApodLocalRepository {
  static const _storageKey = '@medias';

  @override
  Future<void> saveMedias(List<NetworkMedia> medias) async {
    var preferences = await SharedPreferences.getInstance();

    final result = await getMedias();
    final currentMedias = result.getOrThrow();
    String jsonString = '';

    if (currentMedias.isNotEmpty) {
      currentMedias.addAll(medias);
      jsonString = NetworkMedia.toJsonStringList(currentMedias);
    } else {
      jsonString = NetworkMedia.toJsonStringList(medias);
    }

    preferences.setString(_storageKey, jsonString);
  }

  @override
  AsyncResultOf<List<NetworkMedia>> getMedias() async {
    var preferences = await SharedPreferences.getInstance();
    final jsonString = preferences.getString(_storageKey);

    if (jsonString == null) return successOf([]);

    final listResults = jsonDecode(jsonString) as List<dynamic>;
    return successOf(NetworkMedia.fromList(listResults));
  }
}
