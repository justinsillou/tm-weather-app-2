import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:weather_app_2/cubit/weather_cubit.dart';
import 'package:weather_app_2/views/initial_state_widget.dart';
import 'package:weather_app_2/views/loading_widget.dart';
import 'package:weather_app_2/views/weather_home.dart';

void main() async {
  await initIntlAndLocale();
  runApp(const MyApp());
}

Future<void> initIntlAndLocale() async {
  Intl.defaultLocale = 'fr_FR';
  await findSystemLocale();
  await initializeDateFormatting(Intl.defaultLocale!, null);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: const Locale('fr', 'FR'),
      home: const WeatherSelectScreen(),
    );
  }
}

class WeatherSelectScreen extends StatefulWidget {
  const WeatherSelectScreen({super.key});

  @override
  State<WeatherSelectScreen> createState() => _WeatherSelectScreenState();
}

class _WeatherSelectScreenState extends State<WeatherSelectScreen> {
  WeatherState state = WeatherInitialState();
  // display view depending on the state of the cubit
  @override
  Widget build(BuildContext context) {
    if (state is WeatherInitialState) {
      return const InitialStateWidget();
    } else if (state is WeatherLoadingState) {
      return const LoadingWidget();
    } else {
      return const InitialStateWidget();
    }
  }
}
