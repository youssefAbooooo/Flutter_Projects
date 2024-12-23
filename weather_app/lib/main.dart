import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          MaterialColor weatherColor = getWeatherColor(
              BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.weatherCondition);
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: weatherColor,
              appBarTheme: AppBarTheme(
                backgroundColor: weatherColor,
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: weatherColor,
              ),
            ),
            // darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        });
      }),
    );
  }
}

MaterialColor getWeatherColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.blue;
  }
  log(weatherCondition);
  if (weatherCondition.contains('Sunny') ||
      weatherCondition.contains('Clear')) {
    return Colors.orange;
  }

  // Partly Cloudy Conditions
  else if (weatherCondition.contains('Partly Cloudy')) {
    return Colors.lightBlue;
  }

  // Cloudy Conditions
  else if (weatherCondition.contains('Cloudy') ||
      weatherCondition.contains('Overcast')) {
    return Colors.blueGrey;
  }

  // Misty Conditions
  else if (weatherCondition.contains('Mist') ||
      weatherCondition.contains('Fog')) {
    return Colors.grey;
  }

  // Rain Conditions
  else if (weatherCondition.contains('rain') ||
      weatherCondition.contains('Rain')) {
    return Colors.blue;
  }

  // Snow Conditions
  else if (weatherCondition.contains('snow') ||
      weatherCondition.contains('Snow')) {
    return Colors.lightBlue;
  }

  // Thunderstorm Conditions
  else if (weatherCondition.contains('thunder') ||
      weatherCondition.contains('Thunder')) {
    return Colors.deepPurple;
  }

  // Sleet and Freezing Conditions
  else if (weatherCondition.contains('sleet') ||
      weatherCondition.contains('Sleet') ||
      weatherCondition.contains('freezing') ||
      weatherCondition.contains('Freezing')) {
    return Colors.teal;
  }

  // Extreme Conditions
  else if (weatherCondition.contains('Blowing') ||
      weatherCondition.contains('Blizzard')) {
    return Colors.indigo;
  }

  // Ice Conditions
  else if (weatherCondition.contains('Ice pellets')) {
    return Colors.cyan;
  }

  // Default case
  return Colors.grey;
}
