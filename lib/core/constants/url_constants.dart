class UrlConst {
  static const String baseUrl = 'http://api.openweathermap.org';
  static const String apiId = 'aaa1129fc07f4aacb6763552a1f84c0b';
  static String getWeatherUrlWithCity(
      {required String city, required String uf, bool isActual = false}) {
    final type = isActual ? 'weather' : 'forecast';
    return '$baseUrl/data/2.5/$type?q=$city,$uf&lang=pt_br&units=metric&appid=$apiId';
  }
}
