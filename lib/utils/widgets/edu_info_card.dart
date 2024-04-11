import 'package:flutter/material.dart';

import '../decoratio.dart';
import '../hover_effect/card.dart';

class EduInfoCard extends StatelessWidget {
  final Map<String, dynamic> eduInfoOf;
  const EduInfoCard({Key? key, required this.eduInfoOf}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (widthSize > 800 && widthSize < 1300) ? 100.0 : 0),
      child: HoverEffect(
        margin: 25,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eduInfoOf['Date'].toString(),
                  style: yearStyle,
                ),
                Text(
                  eduInfoOf['CourseName'].toString(),
                  style: titleStyle,
                ),
                Text(
                  '${eduInfoOf['CollegeName'].toString()} ',
                  style: collegeNameStyle,
                ),
                Text(
                  "Credits: "
                  '${eduInfoOf['Marks'].toString()} '
                  "SGPA: "
                  '${eduInfoOf['SGPA'].toString()}',
                  style: clgStyle,
                ),
                Text(
                  eduInfoOf['Description'].toString(),
                  style: clgStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
