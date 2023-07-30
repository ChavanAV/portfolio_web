import 'package:flutter/material.dart';

class OnHoverIconAnimation extends StatefulWidget {
  final Widget child;
  final double margin;
  const OnHoverIconAnimation({Key? key, required this.child, required this.margin}) : super(key: key);
  @override
  State<OnHoverIconAnimation> createState() => _OnHoverIconAnimationState();
}
class _OnHoverIconAnimationState extends State<OnHoverIconAnimation> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final onHoverCardTransform = Matrix4.identity()..translate(0,-8,0);
    final transform = isHovered ? onHoverCardTransform : Matrix4.identity() ;
    return MouseRegion(
        onEnter: (event) => onEntered(true),
        onExit: (event) => onEntered(false),
        child: AnimatedContainer(
            margin: EdgeInsets.all(widget.margin),
            duration: const Duration(milliseconds: 200),
            transform: transform,
            child: widget.child
        )
    );
  }
  void onEntered(bool isHovered) => setState(() {
    this.isHovered = isHovered;
  });
}