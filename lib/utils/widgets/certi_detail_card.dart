import 'package:flutter/material.dart';

import '../../classes_list/all_class_and_list.dart';

class CertiInfo extends StatefulWidget {
  final CertificateList cretificateInfo;
  const CertiInfo({Key? key, required this.cretificateInfo}) : super(key: key);

  @override
  State<CertiInfo> createState() => _CertiInfoState();
}

class _CertiInfoState extends State<CertiInfo> {

  BorderRadius? radius;
  Color? color;
  double? height;
  double? width;
  bool? animate;
  bool? textAppear;

  void chang(bool a) {
    setState(() {
      if (a) {
        height = 450;
        width = 800;
        color = Colors.cyan;
        radius = BorderRadius.circular(40);
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 370;
        width = 370;
        color = Colors.deepOrange;
        radius = BorderRadius.circular(300);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animate = false;
    textAppear = false;
    chang(animate!);
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
          textAppear = false;
        });
      },
      child: Container(
        height: (widthSize > 800 )? 600 : 400,
        width: 800,
        margin: const EdgeInsets.all(10),
        child: Align(
          alignment: const Alignment(0, 0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 270),
            height: height! + 100,
            child: Image(
                image: AssetImage(widget.cretificateInfo.imgPath),
          ),
        )
        ),
      ),
    );
  }
}
