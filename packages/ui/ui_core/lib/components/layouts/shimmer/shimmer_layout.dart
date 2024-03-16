import 'package:core_dependencies/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerLayout extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final bool isDarkColors;

  const ShimmerLayout({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.isDarkColors = false,
  });

  Color get _baseColor =>
      isDarkColors ? const Color(0XFF1d1d1d) : Colors.grey.shade300;

  Color get _highLightColor =>
      isDarkColors ? const Color(0XFF111111) : Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highLightColor,
      enabled: true,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0XFF000000),
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
