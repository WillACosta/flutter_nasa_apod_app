import 'package:feature_media/feature_media.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ConvertDateTimeUseCase usecase;

  setUp(() {
    usecase = ConvertDateTimeUseCase();
  });

  group("ConvertDateTimeUseCase", () {
    test(
      'should convert a given DateTime for correct format',
      () {
        final dateTime = DateTime.parse("2002-02-27T14:00:00-0500");
        const format = "dd/MM/yyyy";

        final actual = usecase(
          ConvertDateTimeParams(date: dateTime, format: format),
        );

        expect(actual, "27/02/2002");
      },
    );
  });
}
