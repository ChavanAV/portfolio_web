import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/widgets/proj_grid_or_list_card.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProjectInfoCard extends StatelessWidget {
  final ItemScrollController itemScrollController;
  final Function()? press;
  // final int? index;
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  const ProjectInfoCard({
    Key? key,
    // this.index,
    this.press,
    required this.itemScrollController,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    // return (index != 0)
    //     ? MouseRegionAnimCard(
    //         index: snapshot.data!.docs.length,
    //         snapshot: snapshot.data!.docs[index!].data(),
    //       )
    //     :
    return SizedBox(
      height: heightSize,
      width: widthSize,
      child: (widthSize > 1100)
          ? GridView.builder(
              itemCount: snapshot.data!.docs.length,
              padding: const EdgeInsets.only(top: 50),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
