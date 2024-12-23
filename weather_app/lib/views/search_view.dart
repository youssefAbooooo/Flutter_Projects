import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) async {
              //! log in the developer library not math library
              // log(value);
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              hintText: 'Enter City Name',
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }
}

//! I will make the variable global ,So I can acess the variable from any file.

// WeatherModel? weatherModel;
