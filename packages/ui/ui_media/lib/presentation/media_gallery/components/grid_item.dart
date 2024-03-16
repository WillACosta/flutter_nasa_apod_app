import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.index,
    required this.itemsLength,
    required this.itemUrl,
    this.label,
    this.onTap,
    this.isImage = false,
  });

  final String? label;
  final int index;
  final int itemsLength;
  final String itemUrl;
  final bool isImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: isImage
                  ? ApodImageView(imageUrl: itemUrl)
                  : Center(
                      child: ApodText.body(
                        'this is a video.',
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
            ),
          ),
          label != null
              ? Positioned(
                  bottom: 25,
                  left: 10,
                  child: ApodText.bodySmallest(
                    label!,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                )
              : const SizedBox.shrink(),
          Positioned(
            bottom: 10,
            left: 10,
            child: ApodText.bodySmallest(
              '23/04/2023',
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
