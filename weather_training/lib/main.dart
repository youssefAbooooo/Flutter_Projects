import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_training/cubits/get_weather_cubit.dart';
import 'package:weather_training/cubits/weather_states.dart';
import 'package:weather_training/views/home_view.dart';

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
        return BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            MaterialColor? weatherColor = getWeatherColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: weatherColor,
                ),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: weatherColor,
                ),
              ),
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.blue;
  }
  // Sunshine and clear conditions
  if (weatherCondition.toLowerCase().contains('sunny') ||
      weatherCondition.toLowerCase().contains('clear')) {
    return Colors.orange;
  }

  // Cloudy conditions
  else if (weatherCondition.toLowerCase().contains('cloudy') ||
      weatherCondition.toLowerCase().contains('overcast')) {
    return Colors.grey;
  }

  // Misty and foggy conditions
  else if (weatherCondition.toLowerCase().contains('mist') ||
      weatherCondition.toLowerCase().contains('fog')) {
    return Colors.blueGrey;
  }
  // Rain conditions
  else if (weatherCondition.toLowerCase().contains('rain') ||
      weatherCondition.toLowerCase().contains('shower')) {
    return Colors.blue;
  }

  // Snow conditions
  else if (weatherCondition.toLowerCase().contains('snow') ||
      weatherCondition.toLowerCase().contains('blizzard')) {
    return Colors.lightBlue;
  }

  // Sleet and ice conditions
  else if (weatherCondition.toLowerCase().contains('sleet') ||
      weatherCondition.toLowerCase().contains('ice pellet')) {
    return Colors.cyan;
  }

  // Thunderstorm conditions
  else if (weatherCondition.toLowerCase().contains('thunder')) {
    return Colors.purple;
  }

  // Freezing conditions
  else if (weatherCondition.toLowerCase().contains('freezing')) {
    return Colors.blue;
  }

  // Default color if no match
  return Colors.blue;
}
