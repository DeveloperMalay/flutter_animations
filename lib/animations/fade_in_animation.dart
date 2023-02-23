import 'package:flutter/material.dart';

class ShadowList extends StatefulWidget {
  @override
  _ShadowListState createState() => _ShadowListState();
}

class _ShadowListState extends State<ShadowList> {
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
    return ListView.builder(
      controller: _scrollController,
      itemCount: 100,
      itemBuilder: (context, index) {
        return ShadowItem(index: index, controller: _scrollController);
      },
    );
  }
}

class ShadowItem extends StatelessWidget {
  final int index;
  final ScrollController controller;

  const ShadowItem({Key? key, required this.index, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opacity = (controller.offset / 100.0 + index) / 100.0;
    return Transform.translate(
      offset: Offset(0.0, 100.0 * (1.0 - opacity)),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(opacity),
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: Center(
          child: Text(index.toString(),
              style: TextStyle(color: Colors.white, fontSize: 24.0)),
        ),
      ),
    );
  }
}
