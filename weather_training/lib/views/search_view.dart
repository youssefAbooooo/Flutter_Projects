import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_training/cubits/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<GetWeatherCubit>(context).getWeather(value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              label: Text('Search'),
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
            ),
          ),
        ),
      ),
    );
  }
}
