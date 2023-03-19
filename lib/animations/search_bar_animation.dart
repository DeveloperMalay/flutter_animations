import 'package:flutter/material.dart';

import '../widgets/search_bar_widget.dart';

class SearchBarAnimation extends StatefulWidget {
  const SearchBarAnimation({Key? key}) : super(key: key);

  @override
  _SearchBarAnimationState createState() => _SearchBarAnimationState();
}

class _SearchBarAnimationState extends State<SearchBarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  TextEditingController searchController = TextEditingController();
  bool clicked = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar Animation'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          // Center(
          //   child: Container(
          //     height: 50,
          //     width: 220,
          //     child: Row(
          //       children: [
          //         Container(
          //           width: _animation.value,
          //           decoration: const BoxDecoration(
          //               color: Colors.black,
          //               borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(50),
          //                   bottomLeft: Radius.circular(50))),
          //           child: const TextField(
          //             cursorColor: Colors.white,
          //             style: TextStyle(color: Colors.white),
          //             decoration: InputDecoration(border: InputBorder.none),
          //           ),
          //         ),
          //         Container(
          //           width: 50,
          //           height: 50,
          //           decoration: const BoxDecoration(
          //               color: Colors.black,
          //               borderRadius: BorderRadius.only(
          //                   topRight: Radius.circular(50),
          //                   bottomRight: Radius.circular(50))),
          //           child: IconButton(
          //               onPressed: () {
          //                 if (!clicked) {
          //                   _animationController.forward();
          //                   setState(() {
          //                     clicked = true;
          //                   });
          //                 } else {
          //                   _animationController.reverse();
          //                   setState(() {
          //                     clicked = false;
          //                   });
          //                 }
          //               },
          //               icon: Icon(
          //                 Icons.search,
          //                 color: Colors.white,
          //               )),
          //         )
          //       ],
          //     ),
          //   ),
          // )
          //   Center(
          //     child: InkWell(
          //       onTap: () {
          //         setState(() {
          //           clicked = !clicked;
          //         });
          //         _animationController.forward();
          //       },
          //       child: AnimatedContainer(
          //         duration: const Duration(milliseconds: 300),
          //         // padding: clicked
          //         //     ? const EdgeInsets.only(left: 5)
          //         //     : const EdgeInsets.symmetric(),
          //         height: 50,
          //         width: clicked ? 350 : 50,
          //         curve: Curves.easeInBack,
          //         // alignment:
          //         //     clicked ? const Alignment(0, 0) : const Alignment(0, 0),
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(100),
          //         ),
          //         child: clicked
          //             ? Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   const Icon(Icons.arrow_back_ios,
          //                       color: Colors.black, size: 30),
          //                 ],
          //               )
          //             : const Icon(Icons.search, color: Colors.black, size: 30),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
