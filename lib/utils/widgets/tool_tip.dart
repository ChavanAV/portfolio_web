import 'package:flutter/material.dart';

class ToolTip extends StatelessWidget {
  final String msg;
  final Widget child;
  const ToolTip({Key? key, required this.child, required this.msg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      height: 50,
      preferBelow: true,
      margin: const EdgeInsets.only(top: 30),
      message: msg,
      textAlign: TextAlign.center,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      decoration: BoxDecoration(
        color: Colors.orange.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }
}
