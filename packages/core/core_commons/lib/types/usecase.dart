import 'result.dart';

abstract interface class SyncUseCase<Source, Params> {
  Source call(Params params);
}

abstract interface class ResultUseCase<T extends Object, Params> {
  SyncResultOf<T> call(Params params);
}

abstract class SyncResultUseCase<T extends Object, Params> {
  SyncResultOf<T> call(Params params);
}

abstract class AsyncResultUseCase<T extends Object, Params> {
  AsyncResultOf<T> call(Params params);
}
