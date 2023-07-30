import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resourses/getx_provider.dart';
import '../utils/widget_provider_class/new_align_widgets.dart';

class WHomeScreen extends StatelessWidget {
  WHomeScreen({Key? key}) : super(key: key);
  final MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    AlignWidget alignWidget = AlignWidget();
    return Obx(
      () {
        final snapshot = myController.skillSnapshotState.value;
        if (snapshot == null ||
            snapshot.hasError ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return (widthSize > 1100)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: widthSize * 0.5,
                      height: heightSize,
                      child: Center(
                        child: alignWidget.profileDescription(
                            40, 22, snapshot, heightSize),
                      )),
                  alignWidget.profileImg(
                    heightSize * 0.5,
                    250,
                  ), //widthSize* 0.2
                ],
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alignWidget.profileImg(heightSize * 0.4, 300),
                    alignWidget.profileDescription(
                        30, 18, snapshot, heightSize),
                  ],
                ),
              );
      },
    );
  }
}
