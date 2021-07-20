import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

class HomeController {
  final GetCurrent getCurrent;
  HomeController({
    required this.getCurrent,
  });

  List<CityEntity> cities = [
    CityEntity(city: 'Silverstone', code: 'UK'),
    CityEntity(city: 'São Paulo', code: 'Brazil'),
    CityEntity(city: 'Melbourne', code: 'Australia'),
    CityEntity(city: 'Monte Carlo', code: 'Monaco'),
  ];

  ValueNotifier<List<ForecastEntity>> forecasts = ValueNotifier([]);
  ValueNotifier<bool> load = ValueNotifier(false);

  getCurrentCities() async {
    load.value = true;
    final result = await getCurrent.call(cities);
    result.fold((left) {}, (right) {
      forecasts.value = right;
    });
    load.value = false;
  }
}
