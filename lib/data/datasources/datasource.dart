import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract class Datasource {
  Future<List<ForecastModel>> getForecast(CityEntity input);
  Future<List<ForecastModel>> getCurrent(List<CityEntity> input);
}
