import 'dart:ui';

import 'package:core_dependencies/flutter_modular.dart';
import 'package:feature_media/feature_media.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

import 'video_media_view.dart';

class MediaItemView extends StatefulWidget {
  final DomainMedia media;
  const MediaItemView({super.key, required this.media});

  @override
  State<MediaItemView> createState() => _MediaItemViewState();
}

class _MediaItemViewState extends State<MediaItemView> {
  DomainMedia get media => widget.media;

  void _navigateToFullScreenView(String url) {
    Modular.to.pushNamed(ModuleRoutes.mediaPreviewFullScreen, arguments: url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ApodColors.appBarDarkColor,
        toolbarHeight: 65,
        elevation: 0,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        automaticallyImplyLeading: true,
        actions: [
          if (media.isImage)
            IconButton(
              onPressed: () => _navigateToFullScreenView(media.urls.defaultUrl),
              icon: const Icon(ApodIcons.fullScreen),
            ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          media.isImage
              ? ApodImageView(imageUrl: media.urls.defaultUrl)
              : VideoMediaView(url: media.urls.defaultUrl),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.2,
            maxChildSize: 0.6,
            builder: (context, sController) {
              return Container(
                padding: ApodInsideSpacing.xl,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: sController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ApodStackSpacing.lg,
                      ApodText.bodyHead(
                        media.title,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                      ApodText.bodySmall(
                        media.localDate!,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      ApodStackSpacing.lg,
                      ApodText.body(
                        media.description,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      ApodStackSpacing.lg,
                      if (media.copyright != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ApodText.body(
                              'Copyright',
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.bold,
                            ),
                            ApodText.body(
                              media.copyright!,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            ApodStackSpacing.md,
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
