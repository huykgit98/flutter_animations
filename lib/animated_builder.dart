import 'package:flutter/material.dart';
import 'package:flutter_animations/utils.dart';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [purple, pink, yellow],
              stops: [0, _controller.value, 1],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white),
          ),
        );
      },
    );
  }
}
