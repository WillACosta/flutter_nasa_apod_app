import 'package:core_commons/core_commons.dart';
import 'package:feature_media/feature_media.dart';

final class MediaGalleryViewModel extends ViewModel {
  final GetMediasUseCase _getMediasUseCase;

  MediaGalleryViewModel(this._getMediasUseCase);

  List<DomainMedia> _mediaList = [];
  List<DomainMedia> searchResults = [];

  Future<void> getMedias() async {
    updateState(UiState.loading);
    final result = await _getMediasUseCase(GetMediasParams());

    result.fold(
      (list) {
        _mediaList = list;
        searchResults = list;
        updateState(UiState.success);
      },
      (failure) {
        updateState(UiState.error);
      },
    );
  }

  void searchMedia(String searchQuery) {
    searchResults = _mediaList.where((media) {
      final title = media.title.toLowerCase();
      return title.contains(searchQuery);
    }).toList();
  }
}
