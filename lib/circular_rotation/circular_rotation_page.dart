import 'dart:math';
import 'package:circular_rotation/circular_rotation.dart';
import 'package:flutter/material.dart';

class SolarSystemView extends StatefulWidget {
  const SolarSystemView({super.key});

  @override
  SolarSystemViewState createState() => SolarSystemViewState();
}

class SolarSystemViewState extends State<SolarSystemView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2700),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double sunSize = 50;
    const double planetSize = 10;
    const double orbitRadius = 100;
    return GestureDetector(
      onTapDown: (position) {
        print(position.globalPosition);
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.black,
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: Container(
                  width: sunSize,
                  height: sunSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                  ),
                ),
              ),

              // The planet orbiting around the sun
              Positioned(
                left: 0,
                top: 0,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final planetX =
                        cos(_animation.value) * orbitRadius + sunSize * 2;
                    final planetY =
                        sin(_animation.value) * orbitRadius + sunSize * 2;

                    return Transform.translate(
                      offset: Offset(planetX, planetY),
                      child: Container(
                        width: planetSize,
                        height: planetSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
