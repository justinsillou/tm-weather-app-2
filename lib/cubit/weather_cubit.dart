import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:jiffy/jiffy.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_2/models/weather_data.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState()); // initial state constructor

  refresh({
    required double latitude,
    required double longitude,
  }) async {
    emit(WeatherLoadingState());
    try {
      var response = await Dio().get(
        "https://api.open-meteo.com/v1/forecast",
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
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
          'start_date': Jiffy.now().startOf(Unit.month).format(pattern: 'yyyy-MM-dd'),
          'end_date': Jiffy.now().add(days: 7).format(pattern: 'yyyy-MM-dd'),
        },
      );
      emit(WeatherLoadedState(WeatherData.fromJson(response.data)));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
