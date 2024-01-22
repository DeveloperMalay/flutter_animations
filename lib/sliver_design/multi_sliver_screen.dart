import 'package:flutter/material.dart';

class MultiSliverScreen extends StatefulWidget {
  const MultiSliverScreen({super.key});

  @override
  State<MultiSliverScreen> createState() => _MultiSliverScreenState();
}

class _MultiSliverScreenState extends State<MultiSliverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver'),
      ),
    );
  }
}
