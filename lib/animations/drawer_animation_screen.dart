// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class Options {
  final Widget icon;
  final String title;

  bool clicked;
  Options({
    required this.icon,
    required this.title,
    required this.clicked,
  });
}

List<Options> optionsList = [
  Options(
    icon: const Icon(
      Icons.home,
      color: Color.fromARGB(255, 11, 210, 180),
    ),
    title: "Home",
    clicked: false,
  ),
  Options(
    icon: const Icon(
      Icons.search,
      color: Colors.white,
    ),
    title: 'Search',
    clicked: false,
  ),
  Options(
    icon: const Icon(
      Icons.calendar_month_rounded,
      color: Colors.white,
    ),
    title: "My Events",
    clicked: false,
  ),
  Options(
    icon: const Icon(
      Icons.content_paste,
      color: Colors.white,
    ),
    title: "Tasks",
    clicked: false,
  ),
  Options(
    icon: const Icon(
      Icons.person_add,
      color: Colors.white,
    ),
    title: "Invite Friends",
    clicked: false,
  ),
  Options(
    icon: const Icon(
      Icons.settings,
      color: Colors.white,
    ),
    title: "Settings",
    clicked: false,
  ),
  Options(
    icon: const Icon(
      Icons.error,
      color: Colors.white,
    ),
    title: "About",
    clicked: false,
  ),
];

class DrawerAniamtionScreen extends StatelessWidget {
  const DrawerAniamtionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDrawer(
      drawer: Material(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              // Container(
              //     height: 300,
              //     width: 300,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(100),
              //         color: const Color.fromARGB(255, 11, 210, 180))),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 100, top: 100),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xff24283b),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 11, 210, 180),
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1600',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: SizedBox(
                      width: 190,
                      child: ListTile(
                        title: Text('DeveloperMalay',
                            style: TextStyle(fontSize: 12)),
                        subtitle: Text('developermalay@gmail.com',
                            style: TextStyle(fontSize: 10)),
                      ),
                    ),
                  ),
                ],
              ),

              ListView.builder(
                  shrinkWrap: true,
                  itemCount: optionsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: ListTile(
                        onTap: () {
                          optionsList[index].clicked =
                              !optionsList[index].clicked;
                        },
                        leading: optionsList[index].icon,
                        title: Text(optionsList[index].title,
                            style: TextStyle(
                                color: index == 0
                                    ? const Color.fromARGB(255, 11, 210, 180)
                                    : Colors.white)),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 46, 51, 76),
          title: const Text('Home Screen'),
        ),
        body: Container(
          color: const Color(0xff414868),
        ),
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.child, required this.drawer});
  final Widget child;
  final Widget drawer;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> with TickerProviderStateMixin {
  late AnimationController _xControllerForChild;
  late Animation<double> _yRotationAnimationForChild;

  late AnimationController _xControllerForDrawer;
  late Animation<double> _yRotationAnimationForDrawer;

  @override
  void initState() {
    super.initState();
    _xControllerForChild = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _yRotationAnimationForChild = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(_xControllerForChild);

    _xControllerForDrawer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _yRotationAnimationForDrawer = Tween<double>(
      begin: pi / 2.7,
      end: 0,
    ).animate(_xControllerForDrawer);
  }

  @override
  void dispose() {
    _xControllerForChild.dispose();
    _xControllerForDrawer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxDrag = screenWidth * 0.8;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        final delta = details.delta.dx / maxDrag;
        _xControllerForChild.value += delta;
        _xControllerForDrawer.value += delta;
      },
      onHorizontalDragEnd: (details) {
        if (_xControllerForChild.value < 0.5) {
          _xControllerForChild.reverse();
          _xControllerForDrawer.reverse();
        } else {
          _xControllerForChild.forward();
          _xControllerForDrawer.forward();
        }
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _xControllerForChild,
          _xControllerForDrawer,
        ]),
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                color: const Color(0xFF1a1b26),
              ),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(_xControllerForChild.value * maxDrag)
                  ..rotateY(_yRotationAnimationForChild.value),
                child: widget.child,
              ),
              Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(
                      -screenWidth + _xControllerForDrawer.value * maxDrag)
                  ..rotateY(_yRotationAnimationForDrawer.value),
                child: widget.drawer,
              ),
            ],
          );
        },
      ),
    );
  }
}
