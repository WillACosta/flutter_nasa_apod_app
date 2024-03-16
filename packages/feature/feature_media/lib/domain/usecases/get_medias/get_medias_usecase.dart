import 'package:core_commons/core_commons.dart';
import 'package:feature_media/feature_media.dart';

typedef _UseCaseType = AsyncResultUseCase<List<DomainMedia>, GetMediasParams>;

class GetMediasUseCase implements _UseCaseType {
  final ApodRepository _apodRepository;

  GetMediasUseCase(this._apodRepository);

  @override
  AsyncResultOf<List<DomainMedia>> call(GetMediasParams params) {
    return _apodRepository.getMedias(resultsCount: params.resultsCount);
  }
}

class GetMediasParams {
  final int resultsCount;
  GetMediasParams({this.resultsCount = 10});
}
