import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PullToRefreshOnErrorLayout extends StatelessWidget {
  const PullToRefreshOnErrorLayout({super.key, required this.onRefresh});

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ApodInsideSpacing.md,
      child: PullToRefreshLayout(
        onRefresh: onRefresh,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          const GenericErrorLayout(),
          ApodStackSpacing.md,
          ApodButton(
            labelText: 'try again',
            onPressed: () async => onRefresh(),
          ),
        ],
      ),
    );
  }
}
