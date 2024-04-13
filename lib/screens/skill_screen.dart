import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resourses/getx_provider.dart';
import '../utils/widgets/my_alert_dialog.dart';
import '../utils/widgets/skills_card.dart';

class SkillScreen extends StatelessWidget {
  SkillScreen({super.key});
  final MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
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
        return SizedBox(
          height: heightSize,
          width: widthSize,
          child: Column(
            children: [
              (heightSize > 200)
                  ? const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text("Tap to see details",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    )
                  : Container(),
              Expanded(
                child: GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (widthSize < 800) ? 2 : 4,
                    childAspectRatio: 8.3 / 5,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return MyAlertDialog(
                              msg: snapshot.data!.docs[index]['Skills']
                                  .toString(),
                            );
                          },
                        );
                      },
                      child: SkillsCard(
                        img:
                            snapshot.data!.docs[index]['SkillImage'].toString(),
                        skillName:
                            snapshot.data!.docs[index]['SkillName'].toString(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
