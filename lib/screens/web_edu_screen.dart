import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/resourses/getx_provider.dart';

import '../utils/widgets/edu_info_card.dart';

class WebEducationScreen extends StatelessWidget {
  WebEducationScreen({Key? key}) : super(key: key);
  final MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return Obx(
      () {
        final snapshot = myController.educationSnapshotState.value;
        if (snapshot == null ||
            snapshot.hasError ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (widthSize > 1300)
                ? Expanded(
                    child: GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        padding: const EdgeInsets.only(top: 30),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                childAspectRatio: 8 / 4),
                        itemBuilder: (context, index) {
                          return EduInfoCard(
                            ///This is for previous method for data from list
                            //eduInfoList: eduInfoList[index],
                            eduInfoOf: snapshot.data!.docs[index].data(),
                          );
                        }),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        padding: const EdgeInsets.only(top: 30),
                        itemBuilder: (context, index) {
                          return EduInfoCard(
                            eduInfoOf: snapshot.data!.docs[index].data(),

                            ///This is for previous method for data from list
                            //eduInfoList: eduInfoList[index],
                          );
                        }),
                  ),
          ],
        );
      },
    );
  }
}
