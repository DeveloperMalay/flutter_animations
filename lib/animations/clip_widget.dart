import 'dart:math';

import 'package:flutter/material.dart';

enum CircleSide { left, right }

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }

    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;
  HalfCircleClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _counterClockwiseRotationcontroller;
  late Animation<double> _counterClockwoseRatationAnimation;
  late AnimationController _flipAnimationcontroller;
  late Animation<double> _flipAnimation;
  @override
  void initState() {
    _counterClockwiseRotationcontroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _counterClockwoseRatationAnimation =
        Tween<double>(begin: 0, end: -(pi / 2)).animate(
      CurvedAnimation(
        parent: _counterClockwiseRotationcontroller,
        curve: Curves.bounceOut,
      ),
    );

//flipanimation
    _flipAnimationcontroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(CurvedAnimation(
        parent: _flipAnimationcontroller, curve: Curves.bounceOut));

//status listener
    _counterClockwiseRotationcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
                begin: _flipAnimation.value, end: _flipAnimation.value + pi)
            .animate(CurvedAnimation(
                parent: _flipAnimationcontroller, curve: Curves.bounceOut));

//reset the flipanimtion controller and start the animation
        _flipAnimationcontroller
          ..reset()
          ..forward();
      }
    });

    _flipAnimationcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterClockwoseRatationAnimation = Tween<double>(
                begin: _counterClockwoseRatationAnimation.value,
                end: _counterClockwoseRatationAnimation.value + -(pi / 2))
            .animate(CurvedAnimation(
                parent: _counterClockwiseRotationcontroller,
                curve: Curves.bounceOut));
        _counterClockwiseRotationcontroller
          ..reset()
          ..forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _counterClockwiseRotationcontroller.dispose();
    _flipAnimationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counterClockwiseRotationcontroller
      ..reset()
      ..forward.delayed(const Duration(seconds: 1));

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: AnimatedBuilder(
          animation: _counterClockwoseRatationAnimation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_counterClockwoseRatationAnimation.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                      animation: _flipAnimation,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.identity()
                            ..rotateY(_flipAnimation.value),
                          alignment: Alignment.centerRight,
                          child: ClipPath(
                              clipper: HalfCircleClipper(side: CircleSide.left),
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  color:
                                      const Color.fromARGB(255, 183, 25, 14))),
                        );
                      }),
                  AnimatedBuilder(
                      animation: _flipAnimation,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.identity()
                            ..rotateY(_flipAnimation.value),
                          alignment: Alignment.centerLeft,
                          child: ClipPath(
                              clipper:
                                  HalfCircleClipper(side: CircleSide.right),
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  color:
                                      const Color.fromARGB(255, 10, 19, 190))),
                        );
                      }),
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
