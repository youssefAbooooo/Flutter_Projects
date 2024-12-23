import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  WeatherServices(this.dio);

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '57bc8e75618146908a0173547240512';

  Future<WeatherModel> getweather({required String cityName}) async {
    try {
      final response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      // print(response);

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      //! Watch Dio Exception video no. 225
      //! if the error from Dio Packaage
      final String errorMessage = e.response?.data["error"]['message'] ??
          'oops, there was an ERROR. Try agian later';
      log(errorMessage);
      throw Exception(errorMessage);
    } catch (e) {
      //!if the error is not from Dio Package so DioException will not catch the error so we need to make another catch
      log(e.toString());
      throw Exception('oops, there was an ERROR. Try agian later');
    }
  }
}
