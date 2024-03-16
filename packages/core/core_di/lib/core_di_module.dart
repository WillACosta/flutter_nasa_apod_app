import 'package:core_dependencies/flutter_modular.dart';
import 'package:core_network/core_network.dart';

class CommonDependenciesModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i
      ..addLazySingleton(HttpClientApp.new)
      ..addInstance(ApodService.create(i.get()));

    super.exportedBinds(i);
  }
}
