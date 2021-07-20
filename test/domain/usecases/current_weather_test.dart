import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_band/core/errors/failure.dart';
import 'package:weather_band/domain/entities/city_entity.dart';
import 'package:weather_band/domain/entities/entities.dart';
import 'package:weather_band/domain/repositories/repository.dart';
import 'package:weather_band/domain/usecases/usecases.dart';

class RepositoryMock extends Mock implements Repository {}

class FailureMock extends Mock implements Failure {}

void main() {
  late RepositoryMock repository;
  late GetCurrent sut;
  late List<CityEntity> cities;

  setUpAll(() {
    cities = [CityEntity(city: 'Salgueiro', code: 'br')];
    repository = RepositoryMock();
    sut = GetCurrent(repository: repository);
  });

  test('Should call respoitory method with success', () async {
    when(() => repository.getCurrent(cities))
        .thenAnswer((invocation) async => Right(<ForecastEntity>[]));
    await sut.call(cities);
    verify(() => repository.getCurrent(cities)).called(1);
  });

  test('Should return a list the Forecast', () async {
    when(() => repository.getCurrent(cities))
        .thenAnswer((invocation) async => Right(<ForecastEntity>[]));
    final result = await sut.call(cities);
    expect(result.isRight, true);
    expect(result.right, isA<List<ForecastEntity>>());
  });

  test('Should return a exception failure it is not working', () async {
    when(() => repository.getCurrent(cities))
        .thenAnswer((invocation) async => Left(FailureMock()));
    final result = await sut.call(cities);
    expect(result.isRight, false);
    expect(result.left, isA<FailureMock>());
  });
}
