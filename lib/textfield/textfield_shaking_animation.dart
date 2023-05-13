
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../login_screen/glowing_animation.dart';

class TextFieldShakingAnimation extends StatefulWidget {
  const TextFieldShakingAnimation({super.key});

  @override
  State<TextFieldShakingAnimation> createState() =>
      _TextFieldShakingAnimationState();
}

class _TextFieldShakingAnimationState extends State<TextFieldShakingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late GlobalKey<FormState> _formKey;

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reset();
    }
  }

  void shake() {
    if (controller.status == AnimationStatus.completed) {
      controller.reset();
      controller.forward();
    } else {
      controller.forward();
    }
  }

  @override
  void initState() {
    _formKey = GlobalKey();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.grey, fontSize: 33),
              ),
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  final sineValue = sin(4 * 2 * pi * controller.value);
                  return Transform.translate(
                    offset: Offset(sineValue * 10, 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            hintText: 'Enter your email'),
                        validator: (value) {
                          if (value!.isEmpty == true) {
                            return "Email id is Invalid";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  );
                }),
            AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  final sineValue = sin(4 * 2 * pi * controller.value);
                  return Transform.translate(
                    offset: Offset(sineValue * 10, 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          hintText: 'Enter your password',
                        ),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return "Password was Incorrect";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 60),
            Center(
              child: GlowingLoginButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  
                    showDialog(
                      context: context,
                      builder: (context) =>
                          Lottie.asset('assets/check.json', animate: true),
                    );
                  } else {
                    shake();
                  }
                },
                text: 'Login',
              ),
            )
          ],
        ),
      ),
    ));
  }
}
