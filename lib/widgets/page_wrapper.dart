import 'package:flutter/material.dart';

import '../utils.dart';
import 'circle.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    Key? key,
    this.appBar,
    this.body,
    this.containerHeight = 500,
    this.hasContainer = true,
  }) : super(key: key);
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final double containerHeight;
  final bool hasContainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff323AE9), Color(0xff4D59D1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            ..._backgroundCircles,
            Positioned.fill(
              child: Center(
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get _backgroundCircles => const [
        Circle(
          color1: pink,
          color2: pinkDark,
          radius: 350,
          left: -120,
          top: -100,
        ),
        Circle(
          color1: pink,
          color2: pinkDark,
          radius: 280,
          right: -120,
          bottom: 200,
        ),
        Circle(
          color1: yellow,
          color2: yellowDark,
          radius: 180,
          right: -60,
          top: -40,
        ),
        Circle(
          color1: yellow,
          color2: yellowDark,
          radius: 400,
          left: -160,
          bottom: -120,
        ),
      ];
}
