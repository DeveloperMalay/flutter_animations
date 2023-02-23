import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedProgressIndecator extends StatefulWidget {
  const AnimatedProgressIndecator({super.key});

  @override
  State<AnimatedProgressIndecator> createState() =>
      _AnimatedProgressIndecatorState();
}

class _AnimatedProgressIndecatorState extends State<AnimatedProgressIndecator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _animationController.forward();
    Timer(Duration(milliseconds: _animation.value.toInt()), () {
      showDialog(
          context: context,
          builder: (context) {
            return const SuccessDialog();
          });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animation.value);
    return Scaffold(
        body: SafeArea(
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LinearProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.green),
                      value: _animation.value,
                    ),
                  ],
                ),
              ),
            );
          }),
    ));
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
