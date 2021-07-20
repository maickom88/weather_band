import '../data/repositories/repositories.dart';
import 'build_datasouce.dart';

WeatherRepository buildWeatherRepository() =>
    WeatherRepository(datasource: buildOpenWeather());
