import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_training/cubits/get_weather_cubit.dart';
import 'package:weather_training/cubits/weather_states.dart';
import 'package:weather_training/views/search_view.dart';
import 'package:weather_training/widgets/no_weather_body.dart';
import 'package:weather_training/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            ///! don't Put const because this body rebuilds
            ///! when the cubit get triggered
            // ignore: prefer_const_constructors
            return WeatherInfoBody();
          } else {
            return const Center(
              child: Text('Oops,\nThe was an ERROR\nType a Real City'),
            );
          }
        },
      ),
    );
  }
}
