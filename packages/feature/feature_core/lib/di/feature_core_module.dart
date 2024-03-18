import 'package:core_dependencies/flutter_modular.dart';
import 'package:feature_core/services/network/network_activity.dart';

class FeatureCoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(NetworkActivityService.new);
    super.exportedBinds(i);
  }
}
