import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_2/models/weather_day.dart';

part 'weather_daily.g.dart';

@JsonSerializable()
class WeatherDaily {
  final List<String> time;

  @JsonKey(name: 'weathercode')
  final List<double>? weatherCode;

  @JsonKey(name: 'temperature_2m_min')
  final List<double>? temperature2mMin;

  @JsonKey(name: 'temperature_2m_max')
  final List<double>? temperature2mMax;

  @JsonKey(name: 'apparent_temperature_min')
  final List<double>? apparentTemperature2mMin;

  @JsonKey(name: 'apparent_temperature_max')
  final List<double>? apparentTemperature2mMax;

  final List<DateTime>? sunrise;
  final List<DateTime>? sunset;

  WeatherDaily({
    required this.time,
    this.weatherCode,
    this.temperature2mMin,
    this.temperature2mMax,
    this.apparentTemperature2mMin,
    this.apparentTemperature2mMax,
    this.sunrise,
    this.sunset,
  });

  WeatherDay? getDay({required int index}) {
    if (index < 0 || index >= time.length) {
      return null;
    }

    return WeatherDay(
      time: time[index],
      weatherCode: weatherCode?[index],
      temperature2mMin: temperature2mMin?[index],
      temperature2mMax: temperature2mMax?[index],
      apparentTemperature2mMin: apparentTemperature2mMin?[index],
      apparentTemperature2mMax: apparentTemperature2mMax?[index],
      sunrise: sunrise?[index],
      sunset: sunset?[index],
    );
  }

  factory WeatherDaily.fromJson(Map<String, dynamic> json) =>
      _$WeatherDailyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDailyToJson(this);
}
