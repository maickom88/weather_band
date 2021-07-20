import '../domain/usecases/usecases.dart';
import '../presentations/pages/details/details.dart';
import 'build_repository.dart';

DetaislController buildDetaislController() => DetaislController(
    getForecast: GetForecast(repository: buildWeatherRepository()));
