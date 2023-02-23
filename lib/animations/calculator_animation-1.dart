import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorAnimation extends StatefulWidget {
  const CalculatorAnimation({super.key});

  @override
  State<CalculatorAnimation> createState() => _CalculatorAnimationState();
}

class _CalculatorAnimationState extends State<CalculatorAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(_animation.value),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 15, 87, 212),
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/rocket1.png',
                          fit: BoxFit.cover,
                        ),
                        // child: Image.network(
                        //   'https://w0.peakpx.com/wallpaper/647/20/HD-wallpaper-3d-monster-3d-cartoon-character-comedy-cool-design-funny-monster-new.jpg',
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
