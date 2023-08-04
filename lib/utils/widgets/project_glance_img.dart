import 'package:flutter/material.dart';

import 'load_indicator.dart';

class ProjectGlance extends StatefulWidget {
  final String imgPath;
  const ProjectGlance({super.key, required this.imgPath});

  @override
  State<ProjectGlance> createState() => _ProjectGlanceState();
}

class _ProjectGlanceState extends State<ProjectGlance> {
  late ImageProvider imageProvider;
  bool isImageLoaded = false;
  @override
  void initState() {
    super.initState();
    loadImage();
  }

  void loadImage() {
    imageProvider = NetworkImage(widget.imgPath);
    ImageStream stream = imageProvider.resolve(ImageConfiguration.empty);
    stream.addListener(ImageStreamListener((_, __) {
      if (mounted) {
        setState(() {
          isImageLoaded = true;
        });
      }
    }, onError: (_, __) {
      if (mounted) {
        setState(() {
          isImageLoaded = false;
        });
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return isImageLoaded
        ? Image(
            image: imageProvider,
            fit: BoxFit.contain,
          )
        : const LoadIndicator();
  }
}
