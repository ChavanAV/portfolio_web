import 'package:flutter/material.dart';

import '../hover_effect/card.dart';

class SkillsCard extends StatelessWidget {
  final String img;
  final String skillName;
  const SkillsCard({Key? key, required this.img, required this.skillName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return HoverEffect(
      margin: (widthSize > 1100) ? 25 : 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img)),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.orange.shade100,
            ],
          ),
        ),
        child: Text(skillName,
            style: TextStyle(
                fontSize: (widthSize > 800) ? 16 : 10,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
