import 'package:core_dependencies/result.dart';
import 'package:core_test/core_test.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/utils.dart';

void main() {
  late ResolveDateRange resolveDateRange;
  late ApodRepository apodRepository;
  late GetMediasUseCase usecase;

  setUpAll(() {
    TestFunctions.registerFallBackValues([
      ResolveDateRangeParams(null, null),
      "",
    ]);
  });

  setUp(() {
    resolveDateRange = MockResolveDateRange();
    apodRepository = MockApodRepository();
    usecase = GetMediasUseCase(resolveDateRange, apodRepository);
  });

  group(
    "GetMediasUsecase",
    () {
      test(
        '''
        should call repository method with default date parameters as use case
        does not pass DateTime values and return a List of DomainMedia
      ''',
        () async {
          when(() => resolveDateRange(any())).thenReturn(
            ('2022-01-01', '2022-01-07'),
          );

          when(
            () => apodRepository.getMedias(
              startDate: any(named: 'startDate'),
              endDate: any(named: 'endDate'),
            ),
          ).thenAnswer((_) async => successOf(MockMedia.domainMediaList));

          final actual = await usecase(GetMediasParams());

          expect(actual.isSuccess(), true);
          expect(actual, Success(MockMedia.domainMediaList));

          verify(
            () => apodRepository.getMedias(
              startDate: captureAny(
                named: 'startDate',
                that: isA<String>().having(
                  (value) => value,
                  'initial date',
                  '2022-01-01',
                ),
              ),
              endDate: captureAny(
                named: 'endDate',
                that: isA<String>().having(
                  (value) => value,
                  'initial date',
                  '2022-01-07',
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
