import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resourses/new_provider.dart';
import '../utils/widget_provider_class/new_align_widgets.dart';
import '../utils/widgets/animated_sidebar.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  BgDecoration bgDecoration = BgDecoration();
  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    return Consumer<IndexProvider>(
      builder: (context, indexProviderModel, child) => Stack(
        children: [
          bgDecoration.rivImg(),
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 40,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            drawer: const SideBarAnim(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          ),
        ],
      ),
    );
  }
}
