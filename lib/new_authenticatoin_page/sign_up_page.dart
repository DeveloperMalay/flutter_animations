import 'package:flutter/material.dart';

import 'login_bottomsheet.dart';

class MainSignUpPage extends StatefulWidget {
  const MainSignUpPage({super.key});

  @override
  State<MainSignUpPage> createState() => _MainSignUpPageState();
}

class _MainSignUpPageState extends State<MainSignUpPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _textController;
  late Animation<double> _logintextAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _textController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 1.4, end: .7).animate(_controller);
    _logintextAnimation =
        Tween<double>(begin: .7, end: 1.4).animate(_textController);
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.forward();
    _textController.forward();
  }

  void _closeAnimation() {
    _controller.reverse();
    _textController.reverse();
  }

  double fontsize1 = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 10, 63),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 31, 10, 63),
          child: Column(
            children: [
              const SizedBox(height: 130),
              ScaleTransition(
                scale: _animation,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontsize1,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      hintText: 'Name',
                      fillColor: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      hintText: 'Email',
                      fillColor: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      hintText: 'Password',
                      fillColor: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 100, 63, 156)),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  _startAnimation();
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      context: context,
                      transitionAnimationController: AnimationController(
                        vsync: Navigator.of(context),
                        duration: const Duration(milliseconds: 600),
                      ),
                      builder: (context) {
                        return LoginBottomSheet(
                          aniamtion: _logintextAnimation,
                        );
                      }).then((value) {
                    _closeAnimation();
                  });
                },
                child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(170),
                            topRight: Radius.circular(170)),
                        color: Colors.white),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Color.fromARGB(255, 100, 63, 156),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
