import 'package:core_commons/core_commons.dart';
import 'package:feature_media/feature_media.dart';

final class MediaGalleryViewModel extends ViewModel {
  final GetMediasUseCase _getMediasUseCase;
  MediaGalleryViewModel(this._getMediasUseCase);

  List<DomainMedia> mediaList = [];

  void getMedias() async {
    updateState(UiState.loading);
    final result = await _getMediasUseCase(GetMediasParams());

    result.fold(
      (list) {
        mediaList = list;
        updateState(UiState.success);
      },
      (failure) {
        updateState(UiState.error);
      },
    );
  }
}
