import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../hover_effect/icon.dart';

class HoverIconButton extends StatelessWidget {
  final FaIcon icon;
  final Function()? press;
  const HoverIconButton({Key? key, required this.icon, required this.press}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return OnHoverIconAnimation(
      margin: 0,
      child: IconButton(
        splashRadius: 3,
        splashColor: Colors.amberAccent,
        alignment: Alignment.center,
        onPressed: press!,
        icon: icon,
      ),
    );
  }
}
