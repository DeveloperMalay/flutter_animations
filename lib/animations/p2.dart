import 'package:flutter/material.dart';

class ResponsiveWidgetContainer extends StatelessWidget {
  final Widget child;
  final int columnCount;
  final List<double>? portraitSettings;
  final List<double>? landscapeSettings;
  final Map<String, List<double>>? breakpoints;

  const ResponsiveWidgetContainer({
    Key? key,
    required this.child,
    this.columnCount = 1,
    this.portraitSettings,
    this.landscapeSettings,
    this.breakpoints,
  }) : super(key: key);

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final settings = (isPortrait ? portraitSettings : landscapeSettings) ??
        breakpoints![getBreakpoint(screenWidth)] ??
        List.filled(columnCount, 1.0 / columnCount);

    final columnWidths = List.generate(columnCount, (index) => settings[index]);

    return Row(
      children: [
        for (var i = 0; i < columnCount; i++)
          Expanded(
            flex: (columnWidths[i] * 100).round(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
          ),
      ],
    );
  }

  String getBreakpoint(double width) {
    if (breakpoints == null) return 'default';

    String breakpoint = 'default';
    for (var entry in breakpoints!.entries) {
      if (width < entry.value.last) {
        breakpoint = entry.key;
        break;
      }
    }

    return breakpoint;
  }
}
