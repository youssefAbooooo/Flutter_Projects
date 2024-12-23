import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_training/cubits/get_weather_cubit.dart';
import 'package:weather_training/cubits/weather_states.dart';
import 'package:weather_training/main.dart';
import 'package:weather_training/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        WeatherModel weathermodel =
            BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                getWeatherColor(weathermodel.weatherCondition),
                getWeatherColor(weathermodel.weatherCondition)[300]!,
                getWeatherColor(weathermodel.weatherCondition)[50]!,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weathermodel.cityName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  weathermodel.countryName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(weathermodel.lastUpdated.timeZoneName),
                Text(
                    "${weathermodel.lastUpdated.day}-${weathermodel.lastUpdated.month}-${weathermodel.lastUpdated.year}"),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      weathermodel.image.contains('https:')
                          ? weathermodel.image
                          : 'https:${weathermodel.image}',
                    ),
                    Text(
                      '${weathermodel.avrTemp.round()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Maxtemp: ${weathermodel.maxTemp.round()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Mintemp: ${weathermodel.minTemp.round()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  weathermodel.weatherCondition,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
