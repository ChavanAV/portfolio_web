import 'package:flutter/material.dart';

TextStyle titleStyle = const TextStyle(fontSize: 32, color: Colors.blueGrey);
TextStyle collegeNameStyle =
    const TextStyle(fontSize: 20, color: Colors.blueGrey);
const yearStyle = TextStyle(fontSize: 18, color: Colors.greenAccent);
const clgStyle = TextStyle(fontSize: 20, color: Colors.black54);
const markStyle = TextStyle(fontSize: 20, color: Colors.black54);
const appnamestyle =
    TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w600);

LinearGradient gradient(int index) {
  return LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    tileMode: TileMode.mirror,
    colors: [
      (index == 1)
          ? const Color(0xFFf09819)
          : (index == 2)
              ? const Color(0xFFa1c4fd)
              : (index == 3)
                  ? const Color(0xFFfa71cd)
                  : (index == 4)
                      ? const Color(0xFFf09819)
                      : (index == 5)
                          ? const Color(0xFF0ba360)
                          : const Color(0xFF0ba360),
      (index == 1)
          ? const Color(0xFFff5858)
          : (index == 2)
              ? const Color(0xFFc2e9fb)
              : (index == 3)
                  ? const Color(0xFFc471f5)
                  : (index == 4)
                      ? const Color(0xFFff5858)
                      : (index == 5)
                          ? const Color(0xFF3cba92)
                          : const Color(0xFF3cba92),
    ],
  );
}
