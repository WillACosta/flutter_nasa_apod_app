import 'package:core_commons/core_commons.dart';
import 'package:feature_media/feature_media.dart';

typedef _UseCaseType = AsyncResultUseCase<List<DomainMedia>, GetMediasParams>;

class GetMediasUseCase implements _UseCaseType {
  final ApodRepository _apodRepository;
  final ConvertDateTimeUseCase _convertDateUseCase;

  GetMediasUseCase(this._apodRepository, this._convertDateUseCase);

  @override
  AsyncResultOf<List<DomainMedia>> call(GetMediasParams params) async {
    final result = await _apodRepository.getMedias(
      resultsCount: params.resultsCount,
    );

    return result.map((mediaList) {
      return mediaList.map(
        (media) {
          final convertedDate = _convertDateUseCase(
            ConvertDateTimeParams(
              date: media.dateTime,
              format: 'd MMM yyyy',
            ),
          );

          return media.copyWith(localDate: convertedDate);
        },
      ).toList();
    });
  }
}

class GetMediasParams {
  final int resultsCount;
  GetMediasParams({this.resultsCount = 10});
}
