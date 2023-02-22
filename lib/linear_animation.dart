import 'dart:async';
import 'package:flutter/material.dart';

class LinearAnimationWidget extends StatefulWidget {
  const LinearAnimationWidget({super.key});

  @override
  State<LinearAnimationWidget> createState() => _LinearAnimationWidgetState();
}

class _LinearAnimationWidgetState extends State<LinearAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _animationController.forward();
    Timer(Duration(milliseconds: _animation.value.toInt() + 3499), () {
      showDialog(
          context: context,
          builder: (context) {
            return const SuccessDialog();
          });
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Progress bar'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    LinearProgressIndicator(
                        valueColor: const AlwaysStoppedAnimation(Colors.green),
                        value: _animation.value)
                  ]),
                );
              })),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Icon(
        Icons.check_circle_outline,
        color: Colors.green,
        size: 150,
      ),
    );
  }
}
