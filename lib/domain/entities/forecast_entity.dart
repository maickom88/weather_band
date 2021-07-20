class ForecastEntity {
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String main;
  final String description;
  final String icon;
  final DateTime date;
  ForecastEntity({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.main,
    required this.description,
    required this.icon,
  });
}
