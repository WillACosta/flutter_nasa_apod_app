import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class AppSearchDelegate<T> extends SearchDelegate<List<T>> {
  AppSearchDelegate({
    required this.items,
    required this.suggestionOrResult,
    required this.itemMatcher,
    this.onSelectItem,
  });

  final List<T> items;
  final Widget Function(List<T>, String) suggestionOrResult;
  final bool Function(T item, String query) itemMatcher;
  final ValueChanged<T>? onSelectItem;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => (query = ''),
        icon: const Icon(ApodIcons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(ApodIcons.arrowRight),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSuggestionOrResult();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return _buildSuggestionOrResult();
  }

  Widget _buildSuggestionOrResult() {
    final List<T> suggestionList = query.isEmpty
        ? items
        : items.where((item) => itemMatcher(item, query)).toList();

    if (suggestionList.isEmpty) {
      return const Center(
        child: ApodText.body("Sorry, we don't find any items for your search"),
      );
    }

    return suggestionOrResult(suggestionList, query);
  }
}
