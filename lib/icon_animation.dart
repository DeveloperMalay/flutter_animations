import 'package:flutter/material.dart';

class IconAnimationWidget extends StatefulWidget {
  const IconAnimationWidget({super.key});

  @override
  State<IconAnimationWidget> createState() => _IconAnimationWidgetState();
}

class _IconAnimationWidgetState extends State<IconAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: IconButton(
                iconSize: 80,
                splashColor: Colors.blueAccent,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  progress: _animationController,
                ),
                onPressed: () {
                  setState(() {
                    isPlaying = !isPlaying;

                    isPlaying
                        ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
