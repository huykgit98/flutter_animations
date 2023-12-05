import 'dart:ui';

import 'package:flutter/material.dart';

class BlurSlider extends StatefulWidget {
  const BlurSlider({Key? key}) : super(key: key);

  @override
  State<BlurSlider> createState() => _BlurSliderState();
}

class _BlurSliderState extends State<BlurSlider> {
  double _sliderValue = 0.01;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 0.01, end: _sliderValue),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Slider(
          value: _sliderValue,
          min: 0.01,
          onChanged: (value) {
            setState(() => _sliderValue = value);
          },
        ),
      ),
      builder: (BuildContext context, double? value, Widget? child) {
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 40 * (value ?? 0.01),
              sigmaY: 40 * (value ?? 0.01),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
