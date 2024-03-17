import 'package:core_dependencies/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class ApodSearchView extends StatelessWidget {
  final Function(String)? onChanged;
  const ApodSearchView({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'search by title or date...',
        hintStyle: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.outline,
        ),
        suffixIcon: const Icon(ApodIcons.search),
      ),
    );
  }
}
