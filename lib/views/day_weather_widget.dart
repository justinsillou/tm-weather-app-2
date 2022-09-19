import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_2/models/weather_day.dart';
import 'package:weather_app_2/utils/utils.dart';
import 'package:weather_app_2/views/day_detail_widget.dart';

class DayWeatherWidget extends StatelessWidget {
  final WeatherDay weatherDay;

  const DayWeatherWidget({
    Key? key,
    required this.weatherDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                DateFormat.EEEE().add_d().format(weatherDay.day),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'weatherIcon-${weatherDay.time}',
                    child: Image.asset(
                      Utils.weatherCodeToImage(weatherDay.weatherCode!),
                    ),
                  ),
                ),
              ),
              Text(
                "Min: ${weatherDay.temperature2mMin}°C",
                textAlign: TextAlign.center,
              ),
              Text(
                "Max: ${weatherDay.temperature2mMax}°C",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DayDetailWidget(weatherDay: weatherDay),
          ),
        );
      },
    );
  }
}
