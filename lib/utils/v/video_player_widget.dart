import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/load_indicator.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  const VideoPlayerWidget({super.key, required this.controller});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  Widget build(BuildContext context) => widget.controller.value.isInitialized
      ? buildVideo()
      : const Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: LoadIndicator(),
            ),
            Icon(
              Icons.play_circle_outline_outlined,
              size: 70.0,
            )
          ],
        );
  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => Center(
        child: AspectRatio(
          aspectRatio: 7.1 / 4,
          // aspectRatio: controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(widget.controller),
              _ControlsOverlay(controller: widget.controller),
              VideoProgressIndicator(
                widget.controller,
                allowScrubbing: true,
                padding: const EdgeInsets.only(right: 40, bottom: 5, left: 5),
                colors: const VideoProgressColors(
                    bufferedColor: Colors.grey, playedColor: Colors.redAccent),
              ),
            ],
          ),
        ),
      );
}

class _ControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  const _ControlsOverlay({required this.controller});
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_circle_outline_outlined,
                      color: Colors.white.withOpacity(0.7),
                      size: 70.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: PopupMenuButton<double>(
            color: const Color(0XFF30A2FF),
            iconSize: 35,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
          ),
        ),
      ],
    );
  }
}
