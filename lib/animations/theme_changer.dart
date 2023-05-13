import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import 'package:flutter_switch/flutter_switch.dart';

ThemeData newTheme = ThemeData(primaryColor: Colors.amber);

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Theme Changer',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ThemeSwitcher(
              clipper: const ThemeSwitcherCircleClipper(),
              builder: (context) {
                return SizedBox(
                  width: 120,
                  child: FlutterSwitch(
                    width: 120.0,
                    height: 55.0,
                    toggleSize: 45.0,
                    value: isToggled,
                    borderRadius: 30.0,
                    padding: 2.0,
                    activeToggleColor: const Color(0xFF6E40C9),
                    inactiveToggleColor: Colors.white,
                    activeSwitchBorder: Border.all(
                      color: Colors.transparent,
                      width: 6.0,
                    ),
                    inactiveSwitchBorder: Border.all(
                      color: Colors.transparent,
                      width: 6.0,
                    ),
                    showOnOff: true,
                    activeColor: const Color(0xFF271052),
                    inactiveColor: const Color(0XFF0089E1).withOpacity(0.2),
                    activeIcon: const Icon(
                      Icons.nightlight_round,
                      color: Color(0xFFF8E3A1),
                    ),
                    activeText: "Dark",
                    inactiveText: "Light",
                    activeTextColor: Colors.white,
                    inactiveTextColor: Colors.black,
                    inactiveIcon: const Icon(
                      Icons.wb_sunny,
                      color: Color(0XFF0089E1),
                    ),
                    onToggle: (e) {
                      setState(() {
                        isToggled = e;
                      });
                      ThemeSwitcher.of(context).changeTheme(
                        theme: ThemeModelInheritedNotifier.of(context)
                                    .theme
                                    .brightness ==
                                Brightness.light
                            ? ThemeData.dark()
                            : ThemeData.light(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
