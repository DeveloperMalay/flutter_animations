import 'dart:math';

import 'package:flutter/material.dart';

import 'animation_controller.dart';

class CustomShakeWidget extends StatefulWidget {
  const CustomShakeWidget({
    required this.child,
    required this.duration,
    required this.shakeCount,
    required this.shakeOffset,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration duration;

  @override
  // ignore: no_logic_in_create_state
  State<CustomShakeWidget> createState() => CustomShakeWidgetState(duration);
}

class CustomShakeWidgetState
    extends AnimationControllerState<CustomShakeWidget> {
  CustomShakeWidgetState(Duration duration) : super(duration);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shake() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        final sineValue =
            sin(widget.shakeCount * 2 * pi * animationController.value);
        return Transform.translate(
          offset: Offset(sineValue * widget.shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}
