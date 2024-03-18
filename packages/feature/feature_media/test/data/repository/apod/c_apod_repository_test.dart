import 'package:core_commons/core_commons.dart';
import 'package:core_network/core_network.dart';
import 'package:core_test/stubs/stubs.dart';
import 'package:feature_core/feature_core.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/utils.dart';

class MockApodService extends Mock implements ApodService {}

class MockApodLocalRepository extends Mock implements ApodLocalRepository {}

class MockNetworkActivityService extends Mock
    implements NetworkActivityService {}

void main() {
  late CApodRepository repository;
  late ApodService service;
  late ApodLocalRepository localRepository;
  late NetworkActivityService activity;

  setUp(() {
    service = MockApodService();
    localRepository = MockApodLocalRepository();
    activity = MockNetworkActivityService();
    repository = CApodRepository(service, localRepository, activity);
  });

  group('ApodRepository', () {
    test(
      'should fetch medias and returns a Success<List<DomainMedia>',
      () async {
        setUpServiceResponseOf(
          () => service.getMedias(any()),
          body: MockMedia.networkMediaList,
          statusCode: 200,
        );

        final actual = await repository.getMedias(resultsCount: 10);

        expect(actual.isSuccess(), true);
        expect(actual.getOrNull(), isA<List<DomainMedia>>());
        verify(() => service.getMedias(10));
      },
    );

    test(
      'should return an Error<UnexpectedFailure> if service throws an exception',
      () async {
        when(() => service.getMedias(any())).thenThrow(
          UnknownException('unknown api error'),
        );

        final actual = await repository.getMedias(resultsCount: 10);

        expect(actual.isError(), true);
        expect(actual.exceptionOrNull(), isA<UnexpectedFailure>());
      },
    );
  });
}
