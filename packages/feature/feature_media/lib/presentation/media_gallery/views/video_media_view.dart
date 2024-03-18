import 'package:core_dependencies/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class VideoMediaView extends StatefulWidget {
  final String url;
  const VideoMediaView({super.key, required this.url});

  @override
  State<VideoMediaView> createState() => _VideoMediaViewState();
}

class _VideoMediaViewState extends State<VideoMediaView> {
  final showSnackBarError = ValueNotifier(false);

  Future<void> _openMediaVideoUrl(String url) async {
    final canLaunch = await canLaunchUrl(Uri.parse(url));

    if (canLaunch) {
      await launchUrl(Uri.parse(url));
    } else {
      showSnackBarError.value = true;
    }
  }

  @override
  void initState() {
    showSnackBarError.addListener(() {
      if (showSnackBarError.value) {
        context.showSnackBar(
          message: "Oops! We couldn't open the url, try again later.",
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    showSnackBarError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ApodText.bodySmall(
          'to see this video media, touch the button',
          color: Theme.of(context).colorScheme.outline,
        ),
        ApodStackSpacing.md,
        ApodButton(
          labelText: 'Open video',
          icon: ApodIcons.externalLink,
          onPressed: () => _openMediaVideoUrl(widget.url),
        ),
      ],
    );
  }
}
