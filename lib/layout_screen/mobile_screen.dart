import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resourses/new_provider.dart';
import '../utils/widget_provider_class/new_align_widgets.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  List<String> btnNames = [
    'Profile',
    'Education',
    'Projects',
    'Experience',
    'Achievements',
    'Resume'
  ];
  BgDecoration bgDecoration = BgDecoration();
  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    return Consumer<IndexProvider>(
      builder: (context, indexProviderModel, child) => Scaffold(
        body: Stack(children: [
          bgDecoration.rivImg(),
          bgDecoration.bgOpacity(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: heightSize * 0.004,
              ),
              Expanded(
                child: SizedBox(
                  width: widthSize,
                  height: heightSize * 0.01,
                  child: ListView.builder(
                    itemCount: btnNames.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const RangeMaintainingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.grey),
                            backgroundColor:
                                (indexProviderModel.currentIndex == index)
                                    ? Colors.orange
                                    : Colors.transparent,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            setState(() {
                              indexProviderModel.currentIndex = index;
                            });
                          },
                          child: Text(
                            btnNames[index],
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black),
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightSize * 0.006,
              ),
              Expanded(
                flex: 20,
                child:
                    indexProviderModel.pages[indexProviderModel.currentIndex],
              ),
              SizedBox(
                height: heightSize * 0.01,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
