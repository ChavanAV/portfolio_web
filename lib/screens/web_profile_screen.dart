import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resourses/getx_provider.dart';
import '../utils/widget_provider_class/new_align_widgets.dart';

class WProfileScreen extends StatelessWidget {
  WProfileScreen({Key? key}) : super(key: key);
  final MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    final heightSize = MediaQuery.of(context).size.height;
    AlignWidget alignWidget = AlignWidget();
    return Obx(
      () {
        final snapshot = myController.profileSnapshotState.value;
        if (snapshot == null ||
            snapshot.hasError ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          Map<String, dynamic> data = snapshot.data!.docs[0].data();
          return (widthSize > 1100)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: widthSize * 0.48,
                        height: heightSize,
                        child: Center(
                          child: SingleChildScrollView(
                            child: alignWidget.profileDescription(
                                40, 22, heightSize, data),
                          ),
                        )),
                    (heightSize > 200)
                        ? SingleChildScrollView(
                            child: alignWidget.profileImg(
                              400,
                              270,
                              data,
                              size,
                            ),
                          )
                        : Container(), //widthSize* 0.2
                  ],
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      alignWidget.profileImg(400, 300, data, size),
                      const SizedBox(
                        height: 30,
                      ),
                      alignWidget.profileDescription(30, 18, heightSize, data),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                );
        }
      },
    );
  }
}
