import 'dart:math';

import 'package:flutter/material.dart';

class OpacityAnimationScreen extends StatefulWidget {
  const OpacityAnimationScreen({super.key});

  @override
  State<OpacityAnimationScreen> createState() => _OpacityAnimationScreenState();
}

class _OpacityAnimationScreenState extends State<OpacityAnimationScreen>
    with SingleTickerProviderStateMixin {
  final String imageLink =
      'https://cdn.dribbble.com/userupload/4045581/file/original-8756eb44ae367eeada93c5d18c9798b1.png?compress=1&resize=752x564&vertical=center';
  final String imageUrl =
      'https://cdn.dribbble.com/userupload/4045582/file/original-7ac7a4b04c0c55e9d405154c928d0c07.png?compress=1&resize=752x564&vertical=center';
  final String image =
      'https://cdn.dribbble.com/userupload/4045583/file/original-e1eaf1d89cbe9b02c3a34b7eca595a16.png?compress=1&resize=752x564&vertical=center';

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: _animation,
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Image.network(imageLink),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, 50.0 * sin(_animation.value)),
          child: child,
        );
      },
    ));
  }
}
