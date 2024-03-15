import 'package:core_test/core_test.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ResolveDateRange usecase;

  final expectedStartDate = DateTime.now().subtract(const Duration(days: 7));
  final expectedEndDate = DateTime.now();

  final expectedDefaultDateRange = [
    expectedStartDate.toString().split(" ").first,
    expectedEndDate.toString().split(" ").first,
  ];

  setUpAll(() {
    TestFunctions.registerFallBackValues([
      expectedDefaultDateRange[0],
      expectedDefaultDateRange[1],
    ]);
  });

  setUp(() {
    usecase = ResolveDateRange();
  });

  test(
    "should return default date values if no one DateTime is provided",
    () {
      final (startDate, endDate) = usecase(ResolveDateRangeParams(null, null));

      expect(startDate, equals(expectedDefaultDateRange[0]));
      expect(endDate, equals(expectedDefaultDateRange[1]));
    },
  );

  test(
    "should return given date values as a formatted string",
    () {
      final (startDate, endDate) = usecase(ResolveDateRangeParams(
        DateTime.parse('2012-02-01'),
        DateTime.parse('2012-02-07'),
      ));

      expect(startDate, equals('2012-02-01'));
      expect(endDate, equals('2012-02-07'));
    },
  );
}
