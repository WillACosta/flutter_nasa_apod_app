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

  BorderRadius getItemBorderRadius(int index, int length) {
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
      );
    }

    if (index == 1) {
      return const BorderRadius.only(
        topRight: Radius.circular(10),
      );
    }

    if (index == length - 1) {
      return const BorderRadius.only(
        bottomRight: Radius.circular(10),
      );
    }

    if (index == length - 2) {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(10),
      );
    }

    return BorderRadius.zero;
  }

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
                  ? ImageViewAtom(imageUrl: itemUrl)
                  : Center(
                      child: Text(
                        'this is a video.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
            ),
          ),
          label != null
              ? Positioned(
                  bottom: 25,
                  left: 10,
                  child: Text(
                    label!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0XFFFFFFFF),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          const Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              '23/04/2023',
              style: TextStyle(
                fontSize: 12,
                color: Color(0XFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
