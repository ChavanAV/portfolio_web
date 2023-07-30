import 'package:flutter/material.dart';

import '../decoratio.dart';
import '../hover_effect/card.dart';

class EduInfoCard extends StatelessWidget {
  final Map<String, dynamic> eduInfoOf;
  const EduInfoCard({Key? key, required this.eduInfoOf}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverEffect(
      margin: 25,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                eduInfoOf['Date'].toString(),
                style: yearStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                eduInfoOf['CourseName'].toString(),
                style: titleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Credits: "
                '${eduInfoOf['Marks'].toString()} '
                "SGPA: "
                '${eduInfoOf['SGPA'].toString()}',
                style: clgStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                eduInfoOf['Description'].toString(),
                style: clgStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
