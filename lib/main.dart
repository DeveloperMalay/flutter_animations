import 'package:flutter/material.dart';
import 'package:opacitydemoapp/button_animation/glowing_animation.dart';
import 'package:opacitydemoapp/screens/login_screen.dart';
import 'animations/roadmap.dart';
import 'button_animation/animated_buttons.dart';
import 'loader/loader_widget.dart';
import 'loader/water_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const LoginScreen());
  }
}
