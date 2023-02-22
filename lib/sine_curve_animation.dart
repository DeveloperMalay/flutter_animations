import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedSineCurve extends StatefulWidget {
  const AnimatedSineCurve({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AnimatedSineCurveState createState() => _AnimatedSineCurveState();
}

class _AnimatedSineCurveState extends State<AnimatedSineCurve>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
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
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Sine Curve')),
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.black,
              child: CustomPaint(
                size: const Size(200, 200),
                painter: SineCurvePainter(_controller.value),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SineCurvePainter extends CustomPainter {
  final double value;

  SineCurvePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height / 2);

    for (int i = 0; i < size.width; i++) {
      final x = i.toDouble();
      final y = size.height / 2 +
          math.sin(value * 2 * math.pi + x / size.width * 2 * math.pi) *
              size.height /
              4;
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
