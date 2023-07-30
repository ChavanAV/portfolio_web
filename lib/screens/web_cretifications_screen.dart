import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/widgets/jump_btn.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../classes_list/all_class_and_list.dart';
import '../utils/widgets/certi_detail_card.dart';

class WCertificationScreen extends StatefulWidget {
  const WCertificationScreen({Key? key}) : super(key: key);

  @override
  State<WCertificationScreen> createState() => _WCertificationScreenState();
}

class _WCertificationScreenState extends State<WCertificationScreen> {
  List<CertificateList> cretificateInfo = certificateInfoList;
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ScrollablePositionedList.builder(
              itemScrollController: itemScrollController,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              itemCount: cretificateInfo.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>  CertiInfo(
              cretificateInfo: cretificateInfo[index],
          )
        ),
      ),
      JumpBtn(itemScrollController: itemScrollController),
    ]);
  }
}
