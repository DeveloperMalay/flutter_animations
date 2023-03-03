import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/material.dart';

class AnimatedButtons extends StatelessWidget {
  const AnimatedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('animated buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AsyncButtonBuilder(
              child: const Text('Click Me'),
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
              builder: (context, child, callback, _) {
                return TextButton(
                  onPressed: callback,
                  child: child,
                );
              },
            ),
            const SizedBox(height: 30),
            AsyncButtonBuilder(
              loadingWidget: const Text('Loading...'),
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));

                // See the examples file for a way to handle timeouts
                throw 'yikes';
              },
              builder: (context, child, callback, buttonState) {
                final buttonColor = buttonState.when(
                  idle: () => Colors.yellow[200],
                  loading: () => Colors.grey,
                  success: () => Colors.orangeAccent,
                  error: (err, stack) => Colors.orange,
                );

                return OutlinedButton(
                  onPressed: callback,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: buttonColor,
                  ),
                  child: child,
                );
              },
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 30),
            AsyncButtonBuilder(
              loadingWidget: const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 16.0,
                  width: 16.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
              successWidget: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.check,
                  color: Colors.purpleAccent,
                ),
              ),
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              loadingSwitchInCurve: Curves.bounceInOut,
              loadingTransitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1.0),
                    end: const Offset(0, 0),
                  ).animate(animation),
                  child: child,
                );
              },
              builder: (context, child, callback, state) {
                return Material(
                  color: state.maybeWhen(
                    success: () => Colors.purple[100],
                    orElse: () => Colors.blue,
                  ),
                  // This prevents the loading indicator showing below the
                  // button
                  clipBehavior: Clip.hardEdge,
                  shape: const StadiumBorder(),
                  child: InkWell(
                    onTap: callback,
                    child: child,
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  'Click Me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
