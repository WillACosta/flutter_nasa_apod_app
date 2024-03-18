import 'package:flutter/material.dart';
import 'package:ui_core/components/atoms/atoms.dart';

extension AppSnackBar on BuildContext {
  void showSnackBar({
    required String? message,
    VoidCallback? onActionPressed,
  }) {
    final snackBar = SnackBar(
      content: ApodText.bodySmall(
        message ?? 'Oops! Encontramos um erro inesperado.',
      ),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: onActionPressed ?? () {},
      ),
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
