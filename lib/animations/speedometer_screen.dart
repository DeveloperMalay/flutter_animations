import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedoMeterScreen extends StatefulWidget {
  const SpeedoMeterScreen({super.key});

  @override
  State<SpeedoMeterScreen> createState() => _SpeedoMeterScreenState();
}

class _SpeedoMeterScreenState extends State<SpeedoMeterScreen> {
  double _speed = 0.0;
  void _updateSpeed(double newSpeed) {
    setState(() {
      _speed = newSpeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: _speed),
              duration: const Duration(seconds: 2),
              builder: (BuildContext context, double value, Widget? child) {
                return Center(
                    child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Colors.orange,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 100,
                        endValue: 150,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10)
                  ], pointers: <GaugePointer>[
                    NeedlePointer(value: value)
                  ], annotations: const <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Text('90.0',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        angle: 90,
                        positionFactor: 0.5)
                  ])
                ]));
              }),
          Slider(
            value: _speed,
            min: 0,
            max: 150,
            onChanged: (double newValue) {
              _updateSpeed(newValue);
            },
          ),
        ],
      ),
    ));
  }
}
