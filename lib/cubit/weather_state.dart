part of 'weather_cubit.dart';

@immutable
class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherData weather;

  WeatherLoadedState(this.weather);
}

class WeatherErrorState extends WeatherState {
  final String message;

  WeatherErrorState(this.message);
}
