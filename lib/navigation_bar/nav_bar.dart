import 'package:flutter/material.dart';
import 'package:opacitydemoapp/animations/ripple_animation.dart';
import 'package:opacitydemoapp/loader/water_animation.dart';
import 'package:opacitydemoapp/login_screen/login_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PersistentNavbar extends StatefulWidget {
  const PersistentNavbar({Key? key}) : super(key: key);

  @override
  _PersistentNavbarState createState() => _PersistentNavbarState();
}

class _PersistentNavbarState extends State<PersistentNavbar> {
  int _selectedIndex = 0;

  List<Widget> _buildScreens() {
    return [
      LoginScreen(),
      RippleAnimation(),
      WaterLoadingAnimation(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.ac_unit_rounded),
        title: 'Login',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.ac_unit_rounded),
        title: 'Animation 1',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.ac_unit_rounded),
        title: 'Animation 2',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: _selectedIndex),
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Color.fromARGB(255, 101, 101, 101),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}
