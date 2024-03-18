import 'package:core_dependencies/shared_preferences.dart';
import 'package:core_network/core_network.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mocks/mock_media.dart';

void main() {
  late CApodLocalRepository repository;

  void setUpSharedPreferences(String key, Object value) {
    final storedValues = {key: value};
    SharedPreferences.setMockInitialValues(storedValues);
  }

  setUp(() => repository = CApodLocalRepository());

  group(
    'CApodLocalRepository',
    () {
      group('getMedias', () {
        test(
          'should return an empty list if there is no data for medias in storage',
          () async {
            setUpSharedPreferences('@notMediaKey', {});

            final result = await repository.getMedias();
            final actual = result.getOrNull()!;
            expect(actual.isEmpty, true);
          },
        );

        test(
          'should return Result<List<NetworkMedia>> with success from storage',
          () async {
            setUpSharedPreferences('@medias', MockMedia.networkMediaListString);

            final result = await repository.getMedias();
            final actual = result.getOrNull()!;
            expect(actual, isA<List<NetworkMedia>>());
          },
        );
      });

      group('saveMedias', () {
        test(
          'should save medias if does not have anything in storage',
          () async {
            setUpSharedPreferences('@medias', '[]');

            await repository.saveMedias(
              MockMedia.networkMediaList,
            );

            final result = await repository.getMedias();
            final actual = result.getOrNull();

            expect(actual, equals(MockMedia.networkMediaList));
          },
        );

        test(
          'should add medias to the existing media list',
          () async {
            setUpSharedPreferences(
              '@medias',
              MockMedia.networkMediaListString,
            );

            await repository.saveMedias(
              MockMedia.networkMediaList,
            );

            final result = await repository.getMedias();
            final actual = result.getOrNull();

            expect(
                actual,
                equals(
                  [
                    MockMedia.networkMedia,
                    MockMedia.networkMedia,
                  ],
                ));
          },
        );
      });
    },
  );
}
