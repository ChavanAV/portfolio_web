import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  final Widget tabScreenLayout;
  const ResponsiveLayout(
      {Key? key,
      required this.webScreenLayout,
      required this.mobileScreenLayout,
      required this.tabScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1100) {
          return webScreenLayout;
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1100) {
          return tabScreenLayout;
        } else {
          return mobileScreenLayout;
        }
      },
    );
  }
}
