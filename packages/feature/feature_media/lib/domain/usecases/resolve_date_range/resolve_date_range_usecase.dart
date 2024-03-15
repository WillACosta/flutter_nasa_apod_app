import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/intl.dart';

typedef _UseCaseType = SyncUseCase<(String, String), ResolveDateRangeParams>;

class ResolveDateRange implements _UseCaseType {
  static const _defaultDaysAgo = Duration(days: 7);

  @override
  (String, String) call(ResolveDateRangeParams params) {
    final now = DateTime.now();
    final startDate = params.startDate ?? now.subtract(_defaultDaysAgo);
    final endDate = params.endDate ?? now;

    final dateResult = [startDate, endDate]
        .map((element) => _convertDateTime(element))
        .toList();

    return (dateResult[0], dateResult[1]);
  }

  String _convertDateTime(
    DateTime date, {
    String format = 'yyyy-MM-dd',
    String? locale,
  }) {
    final dateFormat = DateFormat(format, locale);
    return dateFormat.format(date);
  }
}

class ResolveDateRangeParams {
  final DateTime? startDate;
  final DateTime? endDate;

  ResolveDateRangeParams(this.startDate, this.endDate);
}
