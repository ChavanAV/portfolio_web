import 'package:flutter/material.dart';

import 'load_indicator.dart';

class CertificationInfo extends StatefulWidget {
  final String imgPath;
  const CertificationInfo({Key? key, required this.imgPath}) : super(key: key);

  @override
  State<CertificationInfo> createState() => _CertificationInfoState();
}

class _CertificationInfoState extends State<CertificationInfo> {
  BorderRadius? radius;
  Color? color;
  double? height;
  double? width;
  bool? animate;
  late ImageProvider imageProvider;
  bool isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    animate = false;
    chang(animate!);
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

  void chang(bool a) {
    setState(() {
      if (a) {
        height = 450;
        width = 800;
        color = Colors.cyan;
        radius = BorderRadius.circular(40);
        Future.delayed(const Duration(milliseconds: 300), () {});
      } else {
        height = 370;
        width = 370;
        color = Colors.deepOrange;
        radius = BorderRadius.circular(300);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          animate = true;
          chang(animate!);
        });
      },
      onExit: (event) {
        setState(() {
          animate = false;
          chang(animate!);
        });
      },
      child: Container(
        height: (widthSize > 800) ? 600 : 400,
        width: 800,
        margin: const EdgeInsets.all(10),
        child: Align(
            alignment: const Alignment(0, 0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 270),
              height: height! + 100,
              child: isImageLoaded
                  ? Image(
                      image: imageProvider,
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: (widthSize > 1100) ? 200 : 50),
                      child: const LoadIndicator(),
                    ),
            )),
      ),
    );
  }
}
