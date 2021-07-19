class UrlConst {
  static const String baseUrl = 'http://api.openweathermap.org';
  static const String apiId = 'aaa1129fc07f4aacb6763552a1f84c0b';
  static String getWeatherUrlWithCity(String city) {
    return 'data/2.5/weather?q=$city},br&lang=pt_br&units=metric&appid=$apiId';
  }
}
