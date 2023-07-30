import 'package:animated_sidebar/animated_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resourses/new_provider.dart';

class SideBarAnim extends StatefulWidget {
  const SideBarAnim({
    Key? key,
  }) : super(key: key);
  @override
  State<SideBarAnim> createState() => _SideBarAnimState();
}

class _SideBarAnimState extends State<SideBarAnim> {
  final List<SidebarItem> items = [
    SidebarItem(
      icon: Icons.account_box,
      text: 'Profile',
    ),
    SidebarItem(
      icon: Icons.paste_sharp,
      text: 'Education',
    ),
    SidebarItem(
      icon: Icons.install_mobile,
      text: 'projects',
    ),
    SidebarItem(
      icon: Icons.lightbulb_outline_sharp,
      text: 'Experience',
    ),
    SidebarItem(
      icon: Icons.brightness_medium,
      text: 'Achievements',
    ),
    SidebarItem(
      icon: Icons.contact_page,
      text: 'Resume',
    ),
  ];
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1100) {
      setState(() {
        isExpand = true;
      });
    } else if (MediaQuery.of(context).size.width < 800) {
      setState(() {
        isExpand = true;
      });
    } else {
      setState(() {
        isExpand = false;
      });
    }

    return Consumer<IndexProvider>(
      builder: (context, indexProviderModel, child) => AnimatedSidebar(
        margin: const EdgeInsets.fromLTRB(0, 1, 30, 1),
        expanded: (MediaQuery.of(context).size.width < 500) ? true : isExpand,
        items: items,
        selectedIndex: indexProviderModel.currentIndex,
        autoSelectedIndex: false,
        onItemSelected: (index) =>
            setState(() => indexProviderModel.grantIndex(index)),
        duration: const Duration(milliseconds: 700),
        frameDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.repeated,
            colors: [
              Colors.white,
              Colors.cyan.shade50,
            ],
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.black45,
              blurStyle: BlurStyle.normal,
              blurRadius: 5,
              spreadRadius: 0,
            )
          ],
        ),
        minSize: 90,
        maxSize: 250,
        itemIconSize: 26,
        itemIconColor: Colors.grey.shade700,
        itemHoverColor: Colors.grey.withOpacity(0.3),
        itemSelectedColor: Colors.orange,
        itemTextStyle: TextStyle(color: Colors.grey.shade700, fontSize: 20),
        itemSelectedBorder: const BorderRadius.all(
          Radius.circular(10),
        ),
        itemMargin: 16,
        itemSpaceBetween: 20,
        headerIcon: Icons.ac_unit_sharp,
        headerIconSize: 30,
        headerIconColor: Colors.orange,
        headerTextStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(3, 91, 97, 1)),
        headerText: ' Portfolio',
      ),
    );
  }
}
