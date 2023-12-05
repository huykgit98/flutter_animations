import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/blur_container.dart';
import 'package:flutter_animations/widgets/blur_slider.dart';
import 'package:flutter_animations/widgets/item_picker.dart';
import 'package:flutter_animations/widgets/page_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Implicit Animations',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: const ImplicitAnimations(title: 'Implicit Animations'),
    );
  }
}

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key, required this.title});

  final String title;

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
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
            ],
          ),
        ),
      ),
    );
  }
}
