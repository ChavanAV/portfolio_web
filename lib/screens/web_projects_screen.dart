import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/utils/widgets/jump_btn.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../resourses/getx_provider.dart';
import '../utils/widgets/mouse_resion_anim_card.dart';
import '../utils/widgets/proj_grid_or_list_card.dart';

class WProjectsScreen extends StatefulWidget {
  const WProjectsScreen({Key? key}) : super(key: key);
  @override
  State<WProjectsScreen> createState() => _WProjectsScreenState();
}

class _WProjectsScreenState extends State<WProjectsScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final MyController myController = Get.put(MyController());
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final snapshot = myController.projectSnapshotState.value;
        if (snapshot == null ||
            snapshot.hasError ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Stack(alignment: Alignment.bottomRight, children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // child: ScrollablePositionedList.builder(
                  //   itemScrollController: itemScrollController,
                  //   shrinkWrap: true,
                  //   padding: const EdgeInsets.all(0),
                  //   itemCount: snapshot.data!.docs.length,
                  //   scrollDirection: Axis.vertical,
                  //   itemBuilder: (context, index) => ProjectInfoCard(
                  //     // index: index,
                  //     snapshot: snapshot,
                  //     itemScrollController: itemScrollController,
                  //   ),
                  // ),
                  child: (MediaQuery.of(context).size.width > 1100)
                      ? GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          padding: const EdgeInsets.only(top: 50),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 8.3 / 5),
                          itemBuilder: (context, index) => ShowProjInfoCard(
                            index: index,
                            snapshot: snapshot.data!.docs[index].data(),
                            itemScrollController: itemScrollController,
                          ),
                        )
                      : ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          padding: const EdgeInsets.only(top: 50),
                          itemBuilder: (context, index) => ShowProjInfoCard(
                            index: index,
                            snapshot: snapshot.data!.docs[index].data(),
                            itemScrollController: itemScrollController,
                          ),
                        ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return MouseRegionAnimCard(
                        // index: index,
                        snapshot: snapshot.data!.docs[index].data(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          JumpBtn(itemScrollController: itemScrollController)
        ]);
      },
    );
  }
}
