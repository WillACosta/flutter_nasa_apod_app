import 'dart:ui';

import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
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

  @override
  void initState() {
    _viewModel.getMedias();
    super.initState();
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
        title: const ApodSearchView(),
      ),
      body: Container(
        padding: ApodInsideSpacing.md,
        child: ValueListenableBuilder(
          valueListenable: _viewModel.state,
          builder: (_, state, __) {
            final medias = _viewModel.mediaList;

            if (state == UiState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: medias.length,
              itemBuilder: (_, index) => GridItem(
                index: index,
                label: medias[index].title,
                itemsLength: medias.length,
                isImage: medias[index].isImage,
                itemUrl: medias[index].urls.defaultUrl,
              ),
            );
          },
        ),
      ),
    );
  }
}
