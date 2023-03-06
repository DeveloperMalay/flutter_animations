import 'dart:math';

import 'package:flutter/material.dart';

class WaterLoadingAnimation extends StatefulWidget {
  final double size;
  final Color waterColor;
  final Color borderColor;

  WaterLoadingAnimation({
    required this.size,
    required this.waterColor,
    required this.borderColor,
  });

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
      duration: const Duration(milliseconds: 2000),
    )..repeat();

    _waveAnimation = Tween(begin: 0.0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: widget.borderColor, width: 4),
      ),
      child: AnimatedBuilder(
        animation: _waveAnimation,
        builder: (context, child) {
          return CustomPaint(
            painter: WaterPainter(
              waterHeight: 0.4,
              waterColor: widget.waterColor,
              waveAnimationValue: _waveAnimation.value,
            ),
          );
        },
      ),
    );
  }
}

class WaterPainter extends CustomPainter {
  final double waterHeight;
  final Color waterColor;
  final double waveAnimationValue;

  WaterPainter({
    required this.waterHeight,
    required this.waterColor,
    required this.waveAnimationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    final wavePaint = Paint()..color = waterColor.withOpacity(0.8);

    final path = Path()
      ..moveTo(0, height)
      ..lineTo(0, height * waterHeight);

    final mid = width / 2.0;
    final fullWave = pi * 2.0;
    final norm = 0.4;

    for (var i = -1; i <= 1; i++) {
      final dx = mid + i * width * norm;
      path.lineTo(
          dx,
          height * waterHeight +
              sin(waveAnimationValue + i * 0.5 * fullWave) * 10);
    }

    path.lineTo(width, height * waterHeight);
    path.lineTo(width, height);
    path.close();

    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(WaterPainter oldDelegate) {
    return oldDelegate.waterHeight != waterHeight ||
        oldDelegate.waterColor != waterColor ||
        oldDelegate.waveAnimationValue != waveAnimationValue;
  }
}
