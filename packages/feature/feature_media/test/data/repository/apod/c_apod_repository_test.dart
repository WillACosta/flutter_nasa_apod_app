import 'package:core_commons/core_commons.dart';
import 'package:core_network/core_network.dart';
import 'package:core_test/stubs/stubs.dart';
import 'package:feature_media/data/repository/apod/c_apod_repository.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/utils.dart';

class MockApodService extends Mock implements ApodService {}

void main() {
  late CApodRepository repository;
  late ApodService service;

  setUp(() {
    service = MockApodService();
    repository = CApodRepository(service);
  });

  group('ApodRepository', () {
    const fakeDate = '2022-01-01T00:00:00';

    test(
      'should fetch medias and returns a Success<List<DomainMedia>',
      () async {
        setUpServiceResponseOf(
          () => service.getMedias(any(), any()),
          body: MockMedia.networkMediaList,
          statusCode: 200,
        );

        final actual = await repository.getMedias(
          startDate: fakeDate,
          endDate: fakeDate,
        );

        expect(actual.isSuccess(), true);
        expect(actual.getOrNull(), isA<List<DomainMedia>>());
      },
    );

    test(
      'should return an Error<UnexpectedFailure> if service throws an exception',
      () async {
        when(() => service.getMedias(any(), any())).thenThrow(
          UnknownException('unknown api error'),
        );

        final actual = await repository.getMedias(
          startDate: fakeDate,
          endDate: fakeDate,
        );

        expect(actual.isError(), true);
        expect(actual.exceptionOrNull(), isA<UnexpectedFailure>());
      },
    );
  });
}
