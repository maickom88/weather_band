import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/repository.dart';

class GetCurrent implements Usecase<List<CityEntity>, List<ForecastEntity>> {
  final Repository repository;
  GetCurrent({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<ForecastEntity>>> call(
      List<CityEntity> input) async {
    return await repository.getCurrent(input);
  }
}
