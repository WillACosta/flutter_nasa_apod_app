import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class MediaPreview extends StatelessWidget {
  final String url;
  const MediaPreview({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        padding: ApodInsideSpacing.md,
        child: Center(
          child: ApodImageView(imageUrl: url),
        ),
      ),
    );
  }
}
