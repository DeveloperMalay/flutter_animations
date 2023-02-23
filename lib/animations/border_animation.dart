import 'package:flutter/material.dart';

class GradientPeogressBar extends StatefulWidget {
  const GradientPeogressBar({super.key});

  @override
  State<GradientPeogressBar> createState() => _GradientPeogressBarState();
}

class _GradientPeogressBarState extends State<GradientPeogressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
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
        title: const Text('Border animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(colors: const [
                      Color(0xFF2607E7),
                      Color(0xFF57C0EF),
                      Colors.white,
                    ], stops: [
                      _animation.value / 2,
                      _animation.value,
                      _animation.value,
                    ])),
                child: const SizedBox(height: 10),
              );
            }),
      ),
    );
  }
}




  // return Stack(
              //   children: [
              //     const CircleAvatar(
              //       radius: 50,
              //       backgroundImage: NetworkImage(
              //           'https://pixlr.com/images/index/remove-bg.webp'), // replace with your own avatar image
              //     ),
              //     SizedBox(
              //       width: 50 * 2,
              //       height: 50 * 2,
              //       child: CircularProgressIndicator(
              //         value: _animation.value,
              //         strokeWidth: 4,
              //       ),
              //     ),
              //   ],
              // );