import 'package:flutter/material.dart';

import 'core/theme/theme.dart';

void main() {
  runApp(WeatherBand());
}

class WeatherBand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Band',
      theme: ThemeApp.theme(),
    );
  }
}
