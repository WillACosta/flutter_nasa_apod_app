import 'package:core_commons/core_commons.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter/widgets.dart';

final class MediaGalleryViewModel extends ViewModel {
  final GetMediasUseCase _getMediasUseCase;
  MediaGalleryViewModel(this._getMediasUseCase);

  final List<DomainMedia> _mediaList = [];

  ValueNotifier<bool> isLoadingMoreResults = ValueNotifier(false);
  List<DomainMedia> searchResults = [];

  Future<void> getMedias() async {
    if (_mediaList.isEmpty) {
      updateState(LoadingUiState());
    } else {
      isLoadingMoreResults.value = true;
    }

    final result = await _getMediasUseCase(GetMediasParams());

    result.fold(
      (list) {
        _mediaList.addAll(list);
        searchResults.addAll(list);
        updateState(SuccessUiState());
        isLoadingMoreResults.value = false;
      },
      (failure) {
        updateState(ErrorUiState());
        isLoadingMoreResults.value = false;
      },
    );
  }

  void searchMedia(String searchQuery) {
    searchResults = _mediaList.where((media) {
      final title = media.title.toLowerCase();
      final date = media.localDate!.toLowerCase();
      final conditions = [title, date].join(' ');

      return conditions.contains(searchQuery.toLowerCase());
    }).toList();
  }
}
