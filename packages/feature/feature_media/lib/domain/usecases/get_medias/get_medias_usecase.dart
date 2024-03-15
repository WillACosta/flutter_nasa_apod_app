import 'package:core_commons/core_commons.dart';
import 'package:feature_media/feature_media.dart';

typedef _UseCaseType = AsyncResultUseCase<List<DomainMedia>, GetMediasParams>;

class GetMediasUseCase implements _UseCaseType {
  final ResolveDateRange _resolveDateRange;
  final ApodRepository _apodRepository;

  GetMediasUseCase(this._resolveDateRange, this._apodRepository);

  @override
  AsyncResultOf<List<DomainMedia>> call(GetMediasParams params) {
    final (startDate, endDate) = _resolveDateRange(
      ResolveDateRangeParams(params.startDate, params.endDate),
    );

    return _apodRepository.getMedias(
      startDate: startDate,
      endDate: endDate,
    );
  }
}
