import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/entities/forecast_entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/datasource.dart';

class WeatherRepository implements Repository {
  final Datasource datasource;
  WeatherRepository({
    required this.datasource,
  });
  @override
  Future<Either<Failure, List<ForecastEntity>>> getForecast(
      CityEntity input) async {
    try {
      return Right(await datasource.getForecast(input));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
