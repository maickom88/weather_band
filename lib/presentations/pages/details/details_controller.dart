import 'package:flutter/material.dart';

import '../../../domain/entities/city_entity.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_forecast.dart';

class DetaislController {
  final GetForecast getForecast;
  DetaislController({
    required this.getForecast,
  });

  ValueNotifier<List<ForecastEntity>> forecasts = ValueNotifier([]);
  ValueNotifier<bool> load = ValueNotifier(false);

  getForecasts(CityEntity city) async {
    load.value = true;
    final result = await getForecast.call(city);
    result.fold((left) {}, (right) {
      forecasts.value = showOnlyFive(right);
    });
    load.value = false;
  }

  List<ForecastEntity> showOnlyFive(List<ForecastEntity> forecasts) {
    var newForecasts = <ForecastEntity>[];
    for (var forecast in forecasts) {
      if (newForecasts.length < 5 && newForecasts.isNotEmpty) {
        final fistForecast = newForecasts.last;
        if (fistForecast.date.day < forecast.date.day) {
          newForecasts.add(forecast);
        }
      }
      if (newForecasts.isEmpty) {
        newForecasts.add(forecast);
      }
    }
    return newForecasts;
  }
}
