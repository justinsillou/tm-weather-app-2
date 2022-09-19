class WeatherDay {
  final String time;

  final double? weatherCode;

  final double? temperature2mMin;

  final double? temperature2mMax;

  final double? apparentTemperature2mMin;

  final double? apparentTemperature2mMax;

  final DateTime? sunrise;
  final DateTime? sunset;

  WeatherDay({
    required this.time,
    this.weatherCode,
    this.temperature2mMin,
    this.temperature2mMax,
    this.apparentTemperature2mMin,
    this.apparentTemperature2mMax,
    this.sunrise,
    this.sunset,
  });

  DateTime get day => DateTime.parse(time);
}
