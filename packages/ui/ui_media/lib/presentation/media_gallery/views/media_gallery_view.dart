import 'dart:ui';

import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/flutter_modular.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_media/di/di.dart';
import 'package:ui_media/presentation/media_gallery/viewmodel/media_gallery_viewmodel.dart';

import '../../search/search.dart';
import '../components/components.dart';

class MediaGalleryView extends StatefulWidget {
  const MediaGalleryView({super.key});

  @override
  State<MediaGalleryView> createState() => _MediaGalleryViewState();
}

class _MediaGalleryViewState extends State<MediaGalleryView> {
  final _viewModel = Modular.get<MediaGalleryViewModel>();

  late ScrollController _scrollController;

  @override
  void initState() {
    _viewModel.getMedias();
    _scrollController = ScrollController();
    _scrollController.addListener(_triggerScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onChangeQueryString(String query) {
    setState(() {
      _viewModel.searchMedia(query);
    });
  }

  void _onTouchItem(DomainMedia media) {
    Modular.to.pushNamed(ModuleRoutes.mediaDetail, arguments: media);
  }

  void _triggerScroll() {
    final isTheEndOfScrolling = _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;

    if (isTheEndOfScrolling) {
      _viewModel.getMedias();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ApodColors.appBarDarkColor,
        elevation: 0,
        toolbarHeight: 65,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: ApodSearchView(onChanged: _onChangeQueryString),
      ),
      body: Stack(
        children: [
          Container(
            padding: ApodInsideSpacing.md,
            child: ValueListenableBuilder<UiState>(
              valueListenable: _viewModel.state,
              builder: (_, state, __) {
                final medias = _viewModel.searchResults;

                if (state == UiState.loading) {
                  return const MediaGalleryShimmer();
                }

                if (state == UiState.error) {
                  return PullToRefreshOnErrorLayout(
                    onRefresh: () => _viewModel.getMedias(),
                  );
                }

                if (medias.isEmpty) {
                  return Center(
                    child: ApodText.body(
                      'there is nothing here...',
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  );
                }

                return GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: medias.length,
                  itemBuilder: (_, index) => GridItem(
                    index: index,
                    onTap: () => _onTouchItem(medias[index]),
                    label: medias[index].title,
                    date: medias[index].localDate ?? '',
                    itemsLength: medias.length,
                    isImage: medias[index].isImage,
                    itemUrl: medias[index].urls.defaultUrl,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
