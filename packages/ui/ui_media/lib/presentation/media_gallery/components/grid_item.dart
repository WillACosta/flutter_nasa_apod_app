import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.index,
    required this.itemsLength,
    required this.itemUrl,
    required this.label,
    required this.date,
    this.onTap,
    this.isImage = false,
  });

  final String label;
  final String date;
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
          Positioned(
            bottom: 28,
            left: 10,
            child: ApodText.bodySmallest(
              label,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: ApodText.bodySmallest(
              date,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
