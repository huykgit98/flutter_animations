import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/blur_container.dart';
import 'package:flutter_animations/widgets/blur_slider.dart';
import 'package:flutter_animations/widgets/item_picker.dart';
import 'package:flutter_animations/widgets/page_wrapper.dart';

import 'animated_builder.dart';
import 'animated_widget.dart';
import 'explicit_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Animations'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double listContainerHeight = MediaQuery.of(context).size.height - 150;
    return PageWrapper(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      containerHeight: listContainerHeight,
      body: SafeArea(
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              BlurContainer(
                containerHeight: listContainerHeight,
                child: ItemPicker(containerHeight: listContainerHeight),
              ),
              const SizedBox(height: 20),
              const BlurSlider(),
              const SizedBox(height: 20),
              const ExplicitAnimations(),
              const SizedBox(height: 20),
              const AnimatedBuilderExample(),
              const SizedBox(height: 20),
              const AnimatedWidgetExample(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
