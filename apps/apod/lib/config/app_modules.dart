import 'package:core_dependencies/flutter_modular.dart';
import 'package:ui_media/ui_media.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: UiMediaModule());
  }
}
