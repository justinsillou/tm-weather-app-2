import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_2/models/weather_day.dart';
import 'package:weather_app_2/utils/utils.dart';

class DayDetailWidget extends StatelessWidget {
  final WeatherDay weatherDay;
  const DayDetailWidget({super.key, required this.weatherDay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat.MMMMEEEEd().format(weatherDay.day),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'weatherIcon-${weatherDay.time}',
                child: Image.asset(
                  Utils.weatherCodeToImage(weatherDay.weatherCode!),
                ),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Min: ${weatherDay.temperature2mMin}°C",
                ),
                Text(
                  "Max: ${weatherDay.temperature2mMax}°C",
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sunrise: ${DateFormat.Hms().format(weatherDay.sunrise!)}",
                ),
                Text(
                  "Sunset: ${DateFormat.Hms().format(weatherDay.sunset!)}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
