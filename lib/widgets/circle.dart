import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final Color color1;
  final Color color2;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final double? radius;
  final bool isPositioned;

  const Circle({
    super.key,
    required this.color1,
    required this.color2,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.radius,
    this.isPositioned = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget circle = Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [color1, color2],
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
        ),
      ),
    );

    return isPositioned
        ? Positioned(
            bottom: bottom,
            right: right,
            top: top,
            left: left,
            height: radius,
            width: radius,
            child: circle,
          )
        : circle;
  }
}
