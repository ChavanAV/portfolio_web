import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/v/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String documentUrl;
  const MyVideoPlayer({super.key, required this.documentUrl});

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.documentUrl))
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.pause());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: controller);
  }
}
