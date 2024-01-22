import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
        title: const Text('Sliver'),
      ),
      body: CustomScrollView(
        slivers: [
          Section(
            title: 'Category #1',
            headerColor: Colors.blue,
            items: List.generate(
                10,
                (index) => ListTile(
                      title: Text('Item #${index + 1}'),
                    )),
          ),
          Section(
            title: 'Category #2',
            headerColor: Colors.red,
            items: List.generate(
                10,
                (index) => ListTile(
                      title: Text('Item #${index + 11}'),
                    )),
          ),
          Section(
            title: 'Category #3',
            headerColor: Colors.red,
            items: List.generate(
                10,
                (index) => ListTile(
                      title: Text('Item #${index + 11}'),
                    )),
          ),
          Section(
            title: 'Category #4',
            headerColor: Colors.red,
            items: List.generate(
                10,
                (index) => ListTile(
                      title: Text('Item #${index + 11}'),
                    )),
          ),
        ],
      ),
    );
  }
}

class Section extends MultiSliver {
  Section({
    Key? key,
    required String title,
    Color headerColor = Colors.white,
    Color titleColor = Colors.black,
    required List<Widget> items,
  }) : super(
          key: key,
          pushPinnedChildren: true,
          children: [
            SliverPinnedHeader(
                child: ColoredBox(
              color: headerColor,
              child: ListTile(
                textColor: titleColor,
                title: Text(title),
              ),
            )),
            SliverList(
              delegate: SliverChildListDelegate.fixed(items),
            ),
          ],
        );
}
