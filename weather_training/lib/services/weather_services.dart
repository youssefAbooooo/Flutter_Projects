import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_training/models/weather_model.dart';

class WeatherServices {
  Dio dio = Dio();

  String apiKey = "57bc8e75618146908a0173547240512";
  String baseUrl = 'http://api.weatherapi.com/v1';

  Future<WeatherModel> getWeather(String cityName) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data["error"]["message"] ?? 'OOPS,there was an ERROR';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
