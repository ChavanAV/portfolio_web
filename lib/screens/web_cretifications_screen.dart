import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/resourses/getx_provider.dart';
import 'package:portfolio_web/utils/widgets/jump_btn.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../utils/widgets/certi_detail_card.dart';

class WCertificationScreen extends StatefulWidget {
  const WCertificationScreen({Key? key}) : super(key: key);

  @override
  State<WCertificationScreen> createState() => _WCertificationScreenState();
}

class _WCertificationScreenState extends State<WCertificationScreen> {
  final MyController myController = Get.put(MyController());
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final snapshot = myController.certificationSnapshotState.value;
        if (snapshot == null ||
            snapshot.hasError ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Stack(alignment: Alignment.bottomRight, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: snapshot.data!.docs.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => CertificationInfo(
                      imgPath: snapshot.data!.docs[index]['CertificateImage']
                          .toString(),
                    )),
          ),
          JumpBtn(itemScrollController: itemScrollController),
        ]);
      },
    );
  }
}
