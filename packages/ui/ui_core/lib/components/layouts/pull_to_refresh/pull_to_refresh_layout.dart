import 'package:flutter/material.dart';

class PullToRefreshLayout extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final List<Widget> children;

  const PullToRefreshLayout({
    super.key,
    required this.onRefresh,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: children,
      ),
    );
  }
}
