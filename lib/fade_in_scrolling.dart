import 'package:flutter/material.dart';

class FadeInList extends StatefulWidget {
  const FadeInList({super.key});

  @override
  _FadeInListState createState()  => _FadeInListState();
}

class _FadeInListState extends State<FadeInList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 100,
        itemBuilder: (context, index) {
          return FadeInItem(index: index, controller: _scrollController);
        },
      ),
    );
  }
}

class FadeInItem extends StatelessWidget {
  final int index;
  final ScrollController controller;

  const FadeInItem({Key? key, required this.index, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opacity = 1.0 - (controller.offset / 100.0 + index) / 100.0;
    return Opacity(
      opacity: opacity,
      child: Container(
        height: 100,
        color: Colors.blue,
        child: Center(
          child: Text(index.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 24.0)),
        ),
      ),
    );
  }
}
