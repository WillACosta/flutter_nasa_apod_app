import 'package:core_commons/core_commons.dart';
import 'package:core_network/core_network.dart';

abstract class ApodLocalRepository {
  Future<void> saveMedias(List<NetworkMedia> medias);
  AsyncResultOf<List<NetworkMedia>> getMedias();
}
