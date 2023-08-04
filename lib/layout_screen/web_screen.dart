import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resourses/new_provider.dart';
import '../utils/widget_provider_class/new_align_widgets.dart';
import '../utils/widgets/animated_sidebar.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({Key? key}) : super(key: key);
  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  BgDecoration bgDecoration = BgDecoration();
  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    return Consumer<IndexProvider>(
        builder: (context, indexProviderModel, child) => Scaffold(
              body: Stack(children: [
                bgDecoration.rivImg(),
                // bgDecoration.bgOpacity(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (heightSize > 200) ? const SideBarAnim() : Container(),
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
