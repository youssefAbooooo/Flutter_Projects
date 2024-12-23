import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

//! NoWeatherState
class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFaliureState extends WeatherState {}
