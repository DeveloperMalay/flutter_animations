import 'package:flutter/material.dart';
import 'package:opacitydemoapp/opacity_animation.dart';

import 'animated_progress_widget.dart';
import 'clip_widget.dart';
import 'fade_in_animation.dart';
import 'fade_in_scrolling.dart';
import 'icon_animation.dart';
import 'linear_animation.dart';
import 'ripple_animation.dart';
import 'sine_curve_animation.dart';
import 'timer.dart';

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
      home: const LinearAnimationWidget(),
    );
  }
}
