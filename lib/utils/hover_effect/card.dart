import 'package:flutter/material.dart';

class HoverEffect extends StatefulWidget {
  final Widget child;
  final double margin;
  const HoverEffect({Key? key, required this.child, required this.margin})
      : super(key: key);
  @override
  State<HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final onHoverCardTransform = Matrix4.identity()..translate(8, 5, 0);
    final transform = isHovered ? onHoverCardTransform : Matrix4.identity();
    return MouseRegion(
        onEnter: (event) => onEntered(true),
        onExit: (event) => onEntered(false),
        child: AnimatedContainer(
            margin: EdgeInsets.all(widget.margin),
            duration: const Duration(milliseconds: 200),
            transform: transform,
            decoration: (isHovered)
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFDF4F5),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(5, 10),
                        color: Colors.black45,
                        blurStyle: BlurStyle.normal,
                        blurRadius: 10,
                        spreadRadius: 0,
                      )
                    ],
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFDF4F5),
                    // border: Border.all(color: Colors.black12),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     // offset: Offset(-1, -2),
                    //     color: Colors.black45,
                    //     blurStyle: BlurStyle.normal,
                    //     blurRadius: 3,
                    //     spreadRadius: 0,
                    //   )
                    // ],
                  ),
            child: widget.child));
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
