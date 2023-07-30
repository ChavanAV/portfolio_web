import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/resourses/getx_provider.dart';

import '../utils/decoratio.dart';
import '../utils/hover_effect/card.dart';

class WExperienceScreen extends StatelessWidget {
  WExperienceScreen({Key? key}) : super(key: key);
  final MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return Obx(
      () {
        final snapshot = myController.experienceSnapshotState.value;
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
            Expanded(
              child: (widthSize > 1300)
                  ? GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      padding: const EdgeInsets.only(top: 30),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              childAspectRatio: 9 / 5),
                      itemBuilder: (context, index) {
                        final snap = snapshot.data!.docs[index].data();
                        return expCard(widthSize, snap);
                      })
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      padding: const EdgeInsets.only(top: 30),
                      itemBuilder: (context, index) {
                        final snap = snapshot.data!.docs[index].data();
                        return expCard(widthSize, snap);
                      }),
            ),
          ],
        );
      },
    );
  }

  Widget expCard(double widthSize, experienceInfoOf) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (widthSize > 800 && widthSize < 1300) ? 100.0 : 0),
      child: HoverEffect(
        margin: 25,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  experienceInfoOf['Date'].toString(),
                  style: yearStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  experienceInfoOf['CompanyName'].toString(),
                  style: titleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  experienceInfoOf['Description'].toString(),
                  style: clgStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
