import 'package:flutter/material.dart';

import '../utils.dart';

class GradientTransition extends AnimatedWidget {
  final Animation<double> gradientEnd;

  const GradientTransition({
    Key? key,
    required this.gradientEnd,
  }) : super(key: key, listenable: gradientEnd);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [purple, pink, yellow],
          stops: [0, gradientEnd.value, 1],
        ),
      ),
    );
  }
}
