import 'package:flutter/material.dart';
import 'package:ui_core/tokens/spacing/apod_stack_spacing.dart';

import '../../components.dart';

class GenericErrorLayout extends StatelessWidget {
  const GenericErrorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ApodText.body(
            'Oops!! Houston, we have a problem!',
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
          ApodStackSpacing.xs,
          ApodText.body(
            'try pull to refresh or touch the button.',
            color: Theme.of(context).colorScheme.outline,
          ),
        ],
      ),
    );
  }
}
