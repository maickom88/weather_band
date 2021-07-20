import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/repository.dart';

class GetForecast implements Usecase<CityEntity, List<ForecastEntity>> {
  final Repository repository;
  GetForecast({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<ForecastEntity>>> call(CityEntity input) async {
    return await repository.getForecast(input);
  }
}
