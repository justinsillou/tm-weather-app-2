import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  void loadData() {
    // TODO: implement loadData
  }

  void selectDay(String day) {
    // TODO: implement selectDay
  }

  void unselectDay() {
    // TODO: implement unselectDay
  }
}
