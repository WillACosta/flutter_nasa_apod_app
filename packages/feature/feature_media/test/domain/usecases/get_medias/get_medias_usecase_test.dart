import 'package:core_dependencies/result.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/utils.dart';

void main() {
  late ApodRepository apodRepository;
  late GetMediasUseCase usecase;
  late MockConvertDateTimeUseCase convertDateTimeUseCase;

  setUp(() {
    apodRepository = MockApodRepository();
    convertDateTimeUseCase = MockConvertDateTimeUseCase();
    usecase = GetMediasUseCase(apodRepository, convertDateTimeUseCase);
  });

  group(
    "GetMediasUsecase",
    () {
      test(
        'should return Result<List<DomainMedia>> when call usecase method',
        () async {
          when(() => convertDateTimeUseCase(any())).thenReturn('23 Dec 2023');

          when(
            () => apodRepository.getMedias(
              resultsCount: any(named: 'resultsCount'),
            ),
          ).thenAnswer(
            (_) async => Success(MockMedia.domainMediaList),
          );

          final actual = await usecase(GetMediasParams(resultsCount: 10));

          expect(actual.isSuccess(), true);
          expect(actual.getOrNull(), isA<List<DomainMedia>>());
          verify(() => convertDateTimeUseCase(any()));
        },
      );
    },
  );
}
