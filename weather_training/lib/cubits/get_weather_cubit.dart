import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_training/cubits/weather_states.dart';
import 'package:weather_training/models/weather_model.dart';
import 'package:weather_training/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  getWeather(String cityName) async {
    try {
      weatherModel = await WeatherServices().getWeather(cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherErrorState());
    }
  }
}
