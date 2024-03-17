import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/intl.dart';

typedef _UseCaseType = SyncUseCase<String, ConvertDateTimeParams>;

class ConvertDateTimeUseCase implements _UseCaseType {
  @override
  String call(ConvertDateTimeParams params) {
    final dateFormat = DateFormat(params.format, params.locale);
    return dateFormat.format(params.date);
  }
}

class ConvertDateTimeParams {
  final DateTime date;
  final String format;
  final String? locale;

  ConvertDateTimeParams({
    required this.date,
    this.format = 'yyyy-MM-dd',
    this.locale,
  });
}
