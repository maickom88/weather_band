import '../domain/usecases/usecases.dart';
import '../presentations/pages/home/home.dart';
import 'factories.dart';

HomeController buildHomeController() => HomeController(
        getCurrent: GetCurrent(
      repository: buildWeatherRepository(),
    ));
