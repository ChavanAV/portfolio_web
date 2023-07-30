import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resourses/new_provider.dart';
import '../utils/widget_provider_class/new_align_widgets.dart';
import '../utils/widgets/animated_sidebar.dart';

class TabScreenLayout extends StatefulWidget {
  const TabScreenLayout({Key? key}) : super(key: key);
  @override
  State<TabScreenLayout> createState() => _TabScreenLayoutState();
}

class _TabScreenLayoutState extends State<TabScreenLayout> {
  BgDecoration bgDecoration = BgDecoration();
  @override
  Widget build(BuildContext context) {
    return Consumer<IndexProvider>(
        builder: (context, indexProviderModel, child) => Scaffold(
              body: Stack(children: [
                bgDecoration.rivImg(),
                bgDecoration.bgOpacity(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SideBarAnim(),
                    Expanded(
                      child: indexProviderModel
                          .pages[indexProviderModel.currentIndex],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ]),
            ));
  }
}
