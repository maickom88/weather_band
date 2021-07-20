import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_band/core/errors/failure.dart';
import 'package:weather_band/data/datasources/datasource.dart';
import 'package:weather_band/data/models/forecast_model.dart';
import 'package:weather_band/data/repositories/repositories.dart';
import 'package:weather_band/domain/entities/city_entity.dart';
import 'package:weather_band/domain/entities/entities.dart';

class DatasourceMock extends Mock implements Datasource {}

class FailureMock extends Mock implements Failure {}

void main() {
  late DatasourceMock datasource;
  late WeatherRepository sut;
  late CityEntity city;
  late List<CityEntity> cities;

  setUpAll(() {
    city = CityEntity(city: 'Salgueiro', code: 'br');
    cities = [CityEntity(city: 'Salgueiro', code: 'br')];
    datasource = DatasourceMock();
    sut = WeatherRepository(datasource: datasource);
  });

  test('Should call respoitory method with success', () async {
    when(() => datasource.getForecast(city))
        .thenAnswer((invocation) async => <ForecastModel>[]);
    await sut.getForecast(city);
    verify(() => datasource.getForecast(city)).called(1);
  });

  test('Should return a list the Forecast', () async {
    when(() => datasource.getForecast(city))
        .thenAnswer((invocation) async => <ForecastModel>[]);
    final result = await sut.getForecast(city);
    expect(result.isRight, true);
    expect(result.right, isA<List<ForecastEntity>>());
  });

  test('Should return a exception failure it is not working', () async {
    when(() => datasource.getForecast(city)).thenThrow(FailureMock());
    final result = await sut.getForecast(city);
    expect(result.isRight, false);
    expect(result.left, isA<FailureMock>());
  });

  test('Should call respoitory method with success', () async {
    when(() => datasource.getCurrent(cities))
        .thenAnswer((invocation) async => <ForecastModel>[]);
    await sut.getCurrent(cities);
    verify(() => datasource.getCurrent(cities)).called(1);
  });

  test('Should return a list the Current Weather', () async {
    when(() => datasource.getCurrent(cities))
        .thenAnswer((invocation) async => <ForecastModel>[]);
    final result = await sut.getCurrent(cities);
    expect(result.isRight, true);
    expect(result.right, isA<List<ForecastEntity>>());
  });

  test('Should return a exception failure it is not working', () async {
    when(() => datasource.getCurrent(cities)).thenThrow(FailureMock());
    final result = await sut.getCurrent(cities);
    expect(result.isRight, false);
    expect(result.left, isA<FailureMock>());
  });
}
