import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/result.dart';
import 'package:core_network/core_network.dart';
import 'package:core_test/stubs/stubs.dart';
import 'package:feature_core/feature_core.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/utils.dart';

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

  setUpNetworkState([bool value = true]) {
    when(() => activity.hasConnection()).thenAnswer((_) async => value);
  }

  group('ApodRepository', () {
    test(
      'should fetch medias and returns a Success<List<DomainMedia> and save it to the local storage',
      () async {
        setUpNetworkState();
        setUpServiceResponseOf(
          () => service.getMedias(any()),
          body: MockMedia.networkMediaList,
          statusCode: 200,
        );

        when(() => localRepository.saveMedias(any())).thenAnswer(
          (_) async => Future.value(),
        );

        final actual = await repository.getMedias(resultsCount: 10);

        expect(actual.isSuccess(), true);
        expect(actual.getOrNull(), isA<List<DomainMedia>>());
        verify(() => service.getMedias(10));
        verify(() => localRepository.saveMedias(any()));
      },
    );

    test(
      'should return an Error<UnexpectedFailure> if service throws an exception',
      () async {
        setUpNetworkState();

        when(() => service.getMedias(any())).thenThrow(
          UnknownException('unknown api error'),
        );

        final actual = await repository.getMedias(resultsCount: 10);

        expect(actual.isError(), true);
        expect(actual.exceptionOrNull(), isA<UnexpectedFailure>());
      },
    );

    test(
      'should call local repository method if does not have network connection',
      () async {
        setUpNetworkState(false);
        when(() => localRepository.getMedias()).thenAnswer(
          (_) async => successOf(MockMedia.networkMediaList),
        );

        final actual = await repository.getMedias(resultsCount: 10);

        expect(actual.isSuccess(), true);
        expect(actual.getOrNull(), isA<List<DomainMedia>>());
        verifyNever(() => service.getMedias(10));
      },
    );
  });
}
