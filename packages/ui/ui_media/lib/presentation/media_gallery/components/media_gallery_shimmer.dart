import 'package:flutter/widgets.dart';
import 'package:ui_core/ui_core.dart';

class MediaGalleryShimmer extends StatelessWidget {
  const MediaGalleryShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (_, int index) {
        return ShimmerLayout(
          width: 300,
          height: 300,
          isDarkColors: true,
          borderRadius: BorderRadius.circular(20),
        );
      },
    );
  }
}
