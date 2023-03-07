import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WaterLoadingAnimation extends StatefulWidget {
  @override
  _WaterLoadingAnimationState createState() => _WaterLoadingAnimationState();
}

class _WaterLoadingAnimationState extends State<WaterLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _waveAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _waveAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
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
          animation: _waveAnimation,
          builder: (context, child) {
            return Center(
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: LiquidCircularProgressIndicator(
                  value: _waveAnimation.value, // Set initial value
                  valueColor: const AlwaysStoppedAnimation(
                    Colors.blue,
                  ),
                  backgroundColor: Colors.white,
                  borderColor: Colors.blue,
                  borderWidth: 5.0,
                  direction: Axis.vertical,
                  center: Text(
                    "${(_waveAnimation.value * 100).toStringAsFixed(0)}%",
                    style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    var width = size.width;
    var height = size.height;

    Path path = Path();
    path.moveTo(width / 2, height / 5);
    path.arcToPoint(Offset(width / 5, height / 2),
        radius: Radius.elliptical(width / 5, height / 5),
        rotation: math.pi / 2);
    path.arcToPoint(Offset(width / 2, height / 1.25),
        radius: Radius.elliptical(width / 2.5, height / 2.5),
        rotation: math.pi / 2);
    path.arcToPoint(Offset(width / 1.25, height / 2),
        radius: Radius.elliptical(width / 5, height / 5),
        rotation: math.pi / 2);
    path.arcToPoint(Offset(width / 2, height / 5),
        radius: Radius.elliptical(width / 2.5, height / 2.5),
        rotation: math.pi / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
