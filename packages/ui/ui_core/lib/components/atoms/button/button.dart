import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class ApodButton extends StatelessWidget {
  const ApodButton({
    super.key,
    required this.labelText,
    this.fullWidth = false,
    this.onPressed,
    this.icon,
    this.backgroundColor,
  });

  final bool fullWidth;
  final String labelText;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? backgroundColor;

  bool get _hasIcon => icon != null;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(ApodInsideSpacing.xs),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              side: BorderSide.none,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ApodText.body(
              labelText,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ApodStackSpacing.xxs,
            if (_hasIcon) Icon(icon!),
          ],
        ),
      ),
    );
  }
}
