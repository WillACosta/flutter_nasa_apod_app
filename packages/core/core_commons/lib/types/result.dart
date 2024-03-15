import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/result.dart';

typedef AsyncResultOf<T extends Object> = Future<Result<T, AppFailure>>;
typedef SyncResultOf<T extends Object> = Result<T, AppFailure>;
typedef ResultOf<T extends Object> = Result<T, AppFailure>;
