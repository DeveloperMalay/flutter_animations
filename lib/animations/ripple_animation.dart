import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AvatarGlow(
            glowColor: const Color.fromARGB(255, 241, 119, 32),
            endRadius: 90.0,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: const Duration(milliseconds: 100),
            child: Image.asset(
              'assets/reaper.png',
              height: 160,
            )),
      ),
    );
  }
}






 // child: Material(
        //   // Replace this child with your own
        //   elevation: 8.0,
        //   shape: const CircleBorder(),
        //   child: CircleAvatar(
        //     backgroundColor: Colors.grey[100],
        //     radius: 40.0,
        //     child: Image.network(
        //       'https://image.spreadshirtmedia.com/image-server/v1/products/T993A1PA2168PT10X45Y11D1023056575W15490H18588/views/1,width=378,height=378,appearanceId=1,backgroundColor=F2F2F2/cartoon-cute-red-grim-reaper.jpg',
        //       height: 60,
        //     ),
        //   ),
        // ),
        // Icon(
        //   Icons.favorite,
        //   color: Colors.red,
        // ),