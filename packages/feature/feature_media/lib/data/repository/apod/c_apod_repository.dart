import 'package:core_commons/core_commons.dart';
import 'package:core_network/core_network.dart';
import 'package:feature_media/feature_media.dart';

class CApodRepository implements ApodRepository {
  final ApodService _apodService;

  CApodRepository(this._apodService);

  @override
  AsyncResultOf<List<DomainMedia>> getMedias({
    required int resultsCount,
  }) async {
    final result = await safeApiCall(
      () => _apodService.getMedias(resultsCount),
    );

    return result.map((response) => response.toDomain());
  }
}
