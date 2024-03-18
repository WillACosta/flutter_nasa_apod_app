import 'package:core_dependencies/flutter_modular.dart';
import 'package:feature_media/feature_media.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: FeatureMediaModule());
  }
}
