import 'package:either_dart/either.dart';

import '../../core/errors/errors.dart';
import '../entities/entities.dart';

abstract class Repository {
  Future<Either<Failure, List<ForecastEntity>>> getForecast(CityEntity input);
  Future<Either<Failure, List<ForecastEntity>>> getCurrent(
      List<CityEntity> input);
}
