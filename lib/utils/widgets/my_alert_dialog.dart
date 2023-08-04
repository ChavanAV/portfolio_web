import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String msg;
  const MyAlertDialog({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 1.3,
      margin: EdgeInsets.symmetric(
          horizontal:
              (size.width > 800) ? size.width * 0.25 : size.width * 0.05),
      child: AlertDialog(
        alignment: Alignment.center,
        title: const Text("Skills",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Text(msg,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        backgroundColor: const Color(0XFFC5DFF8),
      ),
    );
  }
}
