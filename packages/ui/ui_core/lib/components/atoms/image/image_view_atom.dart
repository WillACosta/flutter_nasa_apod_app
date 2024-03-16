import 'package:core_dependencies/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../layouts/layouts.dart';

enum ImageType { network, asset }

class ApodImageView extends StatelessWidget {
  const ApodImageView({
    super.key,
    this.type = ImageType.network,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final ImageType type;
  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ImageType.network => CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: width,
          height: height,
          placeholder: (context, url) => const ShimmerLayout(
            width: 300,
            height: 300,
            isDarkColors: true,
          ),
          errorWidget: (_, __, ___) {
            return Container(
              color: Theme.of(context).colorScheme.background,
              child: Text(
                'failed to load this image.',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            );
          },
        ),
      _ => Image.asset(
          imageUrl,
          width: width,
          height: height,
        ),
    };
  }
}
