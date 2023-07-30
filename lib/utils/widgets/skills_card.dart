import 'package:flutter/material.dart';

import '../hover_effect/card.dart';

class SkillsCard extends StatelessWidget {
  final String img;
  final String skillName;
  const SkillsCard({Key? key, required this.img, required this.skillName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    return HoverEffect(
      margin: 0,
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: (widthSize > 800) ? heightSize * 0.12 : heightSize * 0.11,
        width: (widthSize < 800)
            ? widthSize * 0.15
            : (widthSize > 800 && widthSize < 1100)
                ? widthSize * 0.09
                : widthSize * 0.07,
        //(widthSize > 800 ) ? widthSize*0.07 : widthSize*0.15,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.repeated,
            colors: [
              Colors.white,
              Colors.orange.shade100,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 3),
              color: Colors.grey,
              blurStyle: BlurStyle.normal,
              blurRadius: 2,
              spreadRadius: 0,
            )
          ],
        ),
        child: Text(skillName,
            style: TextStyle(
                fontSize: (widthSize > 800) ? 16 : 10,
                fontWeight: FontWeight.w300)),
      ),
    );
  }
}
