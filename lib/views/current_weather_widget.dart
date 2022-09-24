import 'package:flutter/material.dart';
import 'package:weather_app_2/models/weather_current.dart';
import 'package:weather_app_2/utils/utils.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherCurrent _weatherCurrent;
  const CurrentWeatherWidget(
      {super.key, required WeatherCurrent weatherCurrent})
      : _weatherCurrent = weatherCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Image.asset(Utils.weatherCodeToImage(
            _weatherCurrent.weatherCode,
          )),
        ),
        Text(
          "Temperature: ${_weatherCurrent.temperature}°C",
          textAlign: TextAlign.center,
        ),
        Text(
          "Wind speed: ${_weatherCurrent.windSpeed} m/s",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
