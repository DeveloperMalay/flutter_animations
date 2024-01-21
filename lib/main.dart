import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:opacitydemoapp/animations/swipe_right_animation.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isPlatformDark =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? ThemeData.dark() : ThemeData.light();
    return ThemeProvider(
      initTheme: initTheme,
      builder: (_, myTheme) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: myTheme,
          home: const SwipeRightAnimation(),
        );
      },
    );
  }
}
