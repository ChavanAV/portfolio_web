import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resourses/getx_provider.dart';
import '../utils/widgets/proj_grid_or_list_card.dart';

class WProjectsScreen extends StatefulWidget {
  const WProjectsScreen({Key? key}) : super(key: key);
  @override
  State<WProjectsScreen> createState() => _WProjectsScreenState();
}

class _WProjectsScreenState extends State<WProjectsScreen> {
  final MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
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
        return SizedBox(
          height: heightSize,
          width: widthSize,
          child: (widthSize > 1100)
              ? GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 8.3 / 5,
                  ),
                  itemBuilder: (context, index) => ShowProjInfoCard(
                    index: index,
                    snapshot: snapshot.data!.docs[index].data(),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => ShowProjInfoCard(
                      index: index,
                      snapshot: snapshot.data!.docs[index].data(),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
