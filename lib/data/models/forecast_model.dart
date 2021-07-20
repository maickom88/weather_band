import '../../domain/entities/entities.dart';

class ForecastModel implements ForecastEntity {
  final double temp;
  final double maxTemp;
  final double minTemp;

  final String? description;
  final String icon;
  final DateTime date;
  ForecastModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    this.description,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'description': description,
      'icon': icon,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    return ForecastModel(
      temp: map['main']['temp'],
      maxTemp: map['main']['temp_max'],
      minTemp: map['main']['temp_min'],
      description: map['weather'][0]['description'],
      icon: map['weather'][0]['icon'],
      date: DateTime.parse(map['dt_txt']),
    );
  }
}
