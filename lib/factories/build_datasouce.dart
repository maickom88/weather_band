import 'package:http/http.dart';

import '../external/open_weather.dart';

final httpClient = Client();
OpenWeather buildOpenWeather() => OpenWeather(httpClient: httpClient);
