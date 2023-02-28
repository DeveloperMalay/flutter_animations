import 'package:flutter/material.dart';

class ResponsiveWidgetContainer extends StatelessWidget {
  final Widget child;
  final int columnCount;
  final List<double> portraitSettings;
  final List<double> landscapeSettings;
  final Map<String, List<double>> breakpoints;

  ResponsiveWidgetContainer({
    required this.child,
    this.columnCount = 1,
    this.portraitSettings = const [1],
    this.landscapeSettings = const [1],
    this.breakpoints = const {},
  });

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final settings = isLandscape ? landscapeSettings : portraitSettings;

    if (breakpoints.isNotEmpty) {
      final sortedKeys = breakpoints.keys.toList()..sort();
      for (var i = 0; i < sortedKeys.length; i++) {
        final breakpointWidth = double.parse(sortedKeys[i]);
        if (screenWidth < breakpointWidth) {
          settings.clear();
          settings.addAll(breakpoints[sortedKeys[i]]!);
          break;
        }
      }
    }

    final columnWidth = screenWidth / columnCount;
    final childWidth = columnWidth * settings.reduce((a, b) => a + b);
    final childHeight = MediaQuery.of(context).size.height;

    return Container(
      width: childWidth,
      height: childHeight,
      child: Row(
        children: _buildColumns(),
      ),
    );
  }

  List<Widget> _buildColumns() {
    final columns = <Widget>[];
    final settings = portraitSettings.length == columnCount
        ? portraitSettings
        : List.filled(columnCount, portraitSettings[0]);

    for (var i = 0; i < columnCount; i++) {
      final columnWidth = settings[i];
      final column = Expanded(
        flex: (columnWidth * 100).round(),
        child: Column(
          children: [_buildColumnChild(i)],
        ),
      );
      columns.add(column);
    }
    return columns;
  }

  Widget _buildColumnChild(int index) {
    return FractionallySizedBox(
      widthFactor: portraitSettings[index],
      child: child,
    );
  }
}







