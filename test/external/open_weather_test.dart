import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:weather_band/data/models/models.dart';
import 'package:weather_band/domain/entities/city_entity.dart';
import 'package:weather_band/domain/entities/entities.dart';
import 'package:weather_band/external/open_weather.dart';

void main() {
  late Client http;
  late OpenWeather sut;
  late CityEntity city;
  late List<CityEntity> cities;
  setUpAll(() {
    city = CityEntity(city: 'Salgueiro', code: 'br');
    cities = [
      CityEntity(city: 'São Paulo', code: 'Brazil'),
      CityEntity(city: 'Silverstone', code: 'Brazil'),
      CityEntity(city: 'Melbourne', code: 'Australia'),
      CityEntity(city: 'Monte Carlo', code: 'Monaco'),
    ];
    http = Client();
    sut = OpenWeather(httpClient: http);
  });

  test('Should return a list the Forecast', () async {
    final result = await sut.getForecast(city);
    expect(result, isA<List<ForecastModel>>());
  });

  test('Should return a list the Forecast', () async {
    final result = await sut.getCurrent(cities);
    expect(result, isA<List<ForecastModel>>());
  });
}
