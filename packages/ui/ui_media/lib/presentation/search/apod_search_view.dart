import 'package:core_dependencies/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class ApodSearchView extends StatefulWidget {
  final Function(String)? onChanged;

  const ApodSearchView({super.key, this.onChanged});

  @override
  State<ApodSearchView> createState() => _ApodSearchViewState();
}

class _ApodSearchViewState extends State<ApodSearchView> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    _focusNode.addListener(_focusNodeListener);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
  }

  void _focusNodeListener() {
    setState(() {
      if (_focusNode.hasFocus) {
        _isSearching = true;
      } else {
        _isSearching = false;
      }
    });
  }

  void _clearSearchField() {
    _focusNode.unfocus();
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: 'search by title or date...',
        hintStyle: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.outline,
        ),
        suffixIcon: _isSearching
            ? IconButton(
                onPressed: _clearSearchField,
                icon: const Icon(ApodIcons.close),
              )
            : const Icon(ApodIcons.search),
      ),
    );
  }
}
