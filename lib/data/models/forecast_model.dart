import 'dart:convert';

import '../../domain/entities/entities.dart';

class ForecastModel implements ForecastEntity {
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String main;
  final String description;
  final String icon;
  final DateTime date;
  ForecastModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.main,
    required this.description,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'main': main,
      'description': description,
      'icon': icon,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    return ForecastModel(
      temp: map['temp'],
      maxTemp: map['maxTemp'],
      minTemp: map['minTemp'],
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastModel.fromJson(String source) =>
      ForecastModel.fromMap(json.decode(source));
}
