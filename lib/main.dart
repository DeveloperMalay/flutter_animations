import 'package:flutter/material.dart';
import 'package:opacitydemoapp/animations/ripple_animation.dart';
import 'package:opacitydemoapp/login_screen/glowing_animation.dart';
import 'package:opacitydemoapp/login_screen/login_screen.dart';
import 'animations/roadmap.dart';
import 'button_animation/animated_buttons.dart';
import 'loader/loader_widget.dart';
import 'loader/water_animation.dart';
import 'navigation_bar/navigation_bar.dart';
import 'textfield/animated_textfield.dart';
import 'textfield/textfield_shaking_animation.dart';

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
        home: const TextFieldShakingAnimation());
  }
}
