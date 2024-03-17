import 'package:core_dependencies/flutter_modular.dart';
import 'package:core_di/core_di.dart';
import 'package:feature_media/feature_media.dart';
import 'package:ui_media/presentation/media_gallery/viewmodel/media_gallery_viewmodel.dart';
import 'package:ui_media/presentation/media_gallery/views/media_item_view.dart';
import 'package:ui_media/ui_media.dart';

class UiMediaModule extends Module {
  @override
  List<Module> get imports => [CommonDependenciesModule()];

  @override
  void binds(Injector i) {
    i
      ..add(MediaGalleryViewModel.new)
      ..add<ApodRepository>(CApodRepository.new)
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
      );
  }
}
