import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'water_animated_loader.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Animation widget'),
      ),
      body: Column(
        children: [
          WaterLoadingAnimation(
            size: 200,
            waterColor: Colors.blue,
            borderColor: Colors.blue,
          )
          // ListTile(
          //   leading: LoadingAnimationWidget.twistingDots(
          //     leftDotColor: const Color(0xFFFFFFFF),
          //     rightDotColor: Colors.blue,
          //     size: 50,
          //   ),
          //   title: const Text(
          //     'twisting Dots',
          //     textScaleFactor: 1,
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListTile(
          //   leading: LoadingAnimationWidget.staggeredDotsWave(
          //     color: Colors.blue,
          //     size: 50,
          //   ),
          //   title: const Text(
          //     'staggered dots wave',
          //     textScaleFactor: 1,
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListTile(
          //   leading: LoadingAnimationWidget.inkDrop(
          //     color: Colors.blue,
          //     size: 50,
          //   ),
          //   title: const Text(
          //     'inkDrop',
          //     textScaleFactor: 1,
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListTile(
          //   leading: LoadingAnimationWidget.bouncingBall(
          //     color: Colors.blue,
          //     size: 50,
          //   ),
          //   title: const Text(
          //     'bouncingBall',
          //     textScaleFactor: 1,
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListTile(
          //   leading: LoadingAnimationWidget.flickr(
          //     leftDotColor: const Color(0xFFFFFFFF),
          //     rightDotColor: Colors.blue,
          //     size: 50,
          //   ),
          //   title: const Text(
          //     'staggered dots wave',
          //     textScaleFactor: 1,
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListTile(
          //   leading: LoadingAnimationWidget.fourRotatingDots(
          //     color: Colors.blue,
          //     size: 50,
          //   ),
          //   title: const Text(
          //     'staggered dots wave',
          //     textScaleFactor: 1,
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListTile(
          //   leading: LoadingAnimationWidget.newtonCradle(
          //     color: Colors.blue,
          //     size: 50,
          //   ),
          //   title: const Text(
          //     'staggered dots wave',
          //     textScaleFactor: 1,
          //   ),
          // ),
        ],
      ),
    );
  }
}
