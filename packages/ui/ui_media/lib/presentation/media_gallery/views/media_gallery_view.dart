import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_media/presentation/media_gallery/viewmodel/media_gallery_viewmodel.dart';

import '../components/components.dart';

class MediaGalleryView extends StatefulWidget {
  const MediaGalleryView({super.key});

  @override
  State<MediaGalleryView> createState() => _MediaGalleryViewState();
}

class _MediaGalleryViewState extends State<MediaGalleryView> {
  final _viewModel = MediaGalleryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.4),
        elevation: 0,
        toolbarHeight: 65,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: ApodText.body(
          'Media Gallery',
          color: Theme.of(context).colorScheme.onBackground,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(ApodIcons.search)),
        ],
      ),
      body: Container(
        padding: ApodInsideSpacing.md,
        child: FutureBuilder(
          future: _viewModel.getMedias(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              final medias = snapshot.data!;

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
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
