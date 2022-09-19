import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_2/models/weather_data.dart';
import 'package:weather_app_2/models/weather_day.dart';
import 'package:weather_app_2/views/current_weather_widget.dart';
import 'package:weather_app_2/views/day_weather_widget.dart';
import 'package:weather_app_2/views/loading_widget.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  WeatherData? _weatherData;
  DateTime? _refreshDate;

  _fetchWeatherData() async {
    var response = await Dio().get(
      "https://api.open-meteo.com/v1/forecast",
      queryParameters: {
        'latitude': 52.52,
        'longitude': 13.41,
        'current_weather': true,
        'daily': [
          'weathercode',
          'temperature_2m_max',
          'temperature_2m_min',
          'apparent_temperature_max',
          'apparent_temperature_min',
          'sunrise',
          'sunset'
        ],
        'timezone': 'Europe/Paris',
      },
    );

    setState(() {
      _weatherData = WeatherData.fromJson(response.data);
      _refreshDate = DateTime.now();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    if (_weatherData == null) {
      return const LoadingWidget();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Météo'),
        actions: [
          IconButton(
            onPressed: () async {
              await _fetchWeatherData();
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Données mises à jour'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CurrentWeatherWidget(
              weatherCurrent: _weatherData!.currentWeather!,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  WeatherDay? weatherDay =
                      _weatherData!.daily?.getDay(index: index);
                  if (weatherDay != null) {
                    return DayWeatherWidget(weatherDay: weatherDay);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            if (_refreshDate != null)
              Text(
                "Données mises à jour le ${DateFormat.yMd().format(_refreshDate!)} à ${DateFormat.Hms().format(_refreshDate!)}",
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
