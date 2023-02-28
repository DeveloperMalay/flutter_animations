import 'package:flutter/material.dart';

class RoadMap {
  final String title;
  bool click;
  RoadMap({
    required this.title,
    required this.click,
  });
}

List<RoadMap> data = <RoadMap>[
  RoadMap(title: 'Learn Dart programming languange', click: false),
  RoadMap(title: 'learn Flutter to create User Interface', click: false),
  RoadMap(title: 'learn some 3rd party libararies ', click: false),
  RoadMap(
      title: 'learn State management like Bloc, Provider or  Getx',
      click: false),
  RoadMap(title: 'learn Version Control like Git,Github', click: false),
  RoadMap(title: 'learn Firebase', click: false),
  RoadMap(title: 'Then learn Native Integration', click: false)
];

class FlutterRoadMap extends StatefulWidget {
  const FlutterRoadMap({super.key});

  @override
  State<FlutterRoadMap> createState() => _FlutterRoadMapState();
}

class _FlutterRoadMapState extends State<FlutterRoadMap>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Flutter RoadMap')),
        body: FadeTransition(
          opacity: _fadeInFadeOut,
          child: Column(
            children: [
              const SizedBox(height: 30),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        data[index].click
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    data[index].click = !data[index].click;
                                  });
                                },
                                icon: const Icon(Icons.check_circle,
                                    color: Colors.green))
                            : Checkbox(
                                value: data[index].click,
                                onChanged: (e) {
                                  setState(() {
                                    data[index].click = e!;
                                  });
                                }),
                        Text(
                          data[index].title,
                          style: TextStyle(
                              fontSize: 13,
                              color: data[index].click
                                  ? Colors.green
                                  : Colors.white),
                        )
                      ],
                    );
                  })
            ],
          ),
        ));
  }
}
