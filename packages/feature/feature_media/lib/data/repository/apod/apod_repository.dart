import 'package:core_commons/core_commons.dart';

import '../../../domain/domain.dart';

abstract interface class ApodRepository {
  AsyncResultOf<List<DomainMedia>> getMedias({
    required int resultsCount,
  });
}
