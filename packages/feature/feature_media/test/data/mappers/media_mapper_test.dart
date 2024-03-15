import 'package:feature_media/feature_media.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/utils.dart';

void main() {
  group('MediaMapper', () {
    test('should convert a NetworkMedia instance to DomainMedia', () {
      final actual = MockMedia.networkMedia.toDomain();

      expect(actual, isA<DomainMedia>());
      expect(actual, equals(MockMedia.domainMedia));
    });

    test('should convert a List<NetworkMedia> to a List<DomainMedia>', () {
      final actual = MockMedia.networkMediaList.toDomain();

      expect(actual, isA<List<DomainMedia>>());
      expect(actual, equals(MockMedia.domainMediaList));
    });
  });
}
