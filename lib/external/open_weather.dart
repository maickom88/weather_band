import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_band/core/constants/url_constants.dart';
import 'package:weather_band/core/errors/errors.dart';

import '../data/datasources/datasource.dart';
import '../data/models/forecast_model.dart';
import '../domain/entities/city_entity.dart';

class OpenWeather implements Datasource {
  final Client httpClient;
  OpenWeather({
    required this.httpClient,
  });
  @override
  Future<List<ForecastModel>> getForecast(CityEntity input) async {
    try {
      final response = await httpClient.get(
        Uri.parse(
            UrlConst.getWeatherUrlWithCity(city: input.city, uf: input.code)),
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final list = body['list'] as List;
        final forecasts =
            list.map((forecast) => ForecastModel.fromMap(forecast)).toList();
        return forecasts;
      }
      throw _handlerError(response.statusCode);
    } catch (e) {
      throw _handlerError();
    }
  }

  Failure _handlerError([int? statusCode]) {
    if (statusCode == 404) {
      return NotFound();
    }
    if (statusCode == 401) {
      return NotAuthorized();
    }
    return ServerError();
  }
}
