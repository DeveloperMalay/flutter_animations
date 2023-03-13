import 'package:flutter/material.dart';
import 'package:opacitydemoapp/animations/ripple_animation.dart';
import 'package:opacitydemoapp/login_screen/login_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'nav_bar.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('naivgation demo'),
        ),
        bottomNavigationBar: PersistentNavbar());
  }
}

class AnimatedNavbar extends StatefulWidget {
  const AnimatedNavbar({Key? key}) : super(key: key);

  @override
  _AnimatedNavbarState createState() => _AnimatedNavbarState();
}

class _AnimatedNavbarState extends State<AnimatedNavbar> {
  int _selectedIndex = 0;

  static const List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.settings,
  ];
  List<String> label = ['Home', "Search", 'Settings'];
  Color _getColor(int index) {
    return _selectedIndex == index ? Colors.blue : Colors.grey;
  }

  double _getSize(int index) {
    return _selectedIndex == index ? 35 : 30;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: List.generate(
        _icons.length,
        (index) => BottomNavigationBarItem(
          icon: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: _getSize(index),
            width: _getSize(index),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _getColor(index),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _icons[index],
              color: Colors.white,
            ),
          ),
          label: label[index],
        ),
      ),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
