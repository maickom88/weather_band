import 'package:flutter/material.dart';
import 'package:weather_band/core/constants/routes_constants.dart';

import 'core/routes/routes.dart';
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
      initialRoute: RoutesConsts.home,
      routes: Routers.pages,
    );
  }
}
