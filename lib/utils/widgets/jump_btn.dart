import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class JumpBtn extends StatelessWidget {
  final ItemScrollController itemScrollController;
  const JumpBtn({Key? key, required this.itemScrollController}) : super(key: key);

  jumpUp() {
    itemScrollController.scrollTo(
        index: 0,
        duration: const Duration(milliseconds: 1300),
        curve: Curves.bounceOut);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,right: 8.0),
      child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          splashColor: Colors.transparent,
          elevation: 0,
          shape: const StadiumBorder(side: BorderSide(color: Colors.black)),
          // disabledElevation: 0,
          hoverColor: Colors.cyan.shade50,
          hoverElevation: 0,
          child: const Icon(Icons.arrow_upward,color: Colors.black,),
          onPressed: () => jumpUp()),
    );
  }
}
