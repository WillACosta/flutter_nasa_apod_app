import 'package:core_dependencies/flutter_modular.dart';
import 'package:core_di/core_di.dart';
import 'package:feature_core/feature_core.dart';

import '../data/data.dart';
import '../domain/domain.dart';
import '../presentation/media_gallery/viewmodel/media_gallery_viewmodel.dart';
import '../presentation/media_gallery/views/media_item_view.dart';
import '../presentation/presentation.dart';
import 'module_routes.dart';

class FeatureMediaModule extends Module {
  @override
  List<Module> get imports => [
        CommonDependenciesModule(),
        FeatureCoreModule(),
      ];

  @override
  void binds(Injector i) {
    i
      ..add(MediaGalleryViewModel.new)
      ..add<ApodRepository>(CApodRepository.new)
      ..add<ApodLocalRepository>(CApodLocalRepository.new)
      ..add(GetMediasUseCase.new)
      ..add(ConvertDateTimeUseCase.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(ModuleRoutes.initial, child: (_) => const MediaGalleryView())
      ..child(
        ModuleRoutes.mediaDetail,
        child: (_) {
          final param = r.args.data as DomainMedia;
          return MediaItemView(media: param);
        },
      )
      ..child(
        ModuleRoutes.mediaPreviewFullScreen,
        child: (_) {
          final param = r.args.data as String;
          return MediaPreview(url: param);
        },
      );
  }
}
