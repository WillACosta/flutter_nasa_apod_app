import 'package:core_commons/core_commons.dart';
import 'package:core_network/core_network.dart';
import 'package:feature_core/feature_core.dart';
import 'package:feature_media/feature_media.dart';

class CApodRepository implements ApodRepository {
  final ApodService _apodService;
  final ApodLocalRepository _localRepository;
  final NetworkActivityService _networkActivityService;
  late AppLogger _logger;

  CApodRepository(
    this._apodService,
    this._localRepository,
    this._networkActivityService,
  ) {
    _logger = AppLogger('CApodRepository');
  }

  @override
  AsyncResultOf<List<DomainMedia>> getMedias({
    required int resultsCount,
  }) async {
    final hasConnection = await _networkActivityService.hasConnection();

    if (!hasConnection) {
      _logger.info('No internet connection, returning cached results');
      final result = await _localRepository.getMedias();
      return result.map((data) => data.toDomain());
    }

    final result = await safeApiCall(
      () => _apodService.getMedias(resultsCount),
    );

    return result.map(
      (response) {
        _localRepository.saveMedias(response);
        _logger.info(
          'Returning results from network and save it to the storage',
        );
        return response.toDomain();
      },
    );
  }
}
