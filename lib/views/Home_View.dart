// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:my_weather_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:my_weather_app/views/Search_view.dart';
import 'package:my_weather_app/widgets/Loading_body.dart';
import 'package:my_weather_app/widgets/no_weather_body.dart';
import 'package:my_weather_app/widgets/weather_Info_body.dart';
import 'package:my_weather_app/widgets/weather_failure_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(
          'My Weather App ',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is StillLoading) {
            return const LoadingBody();
          } else if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const WeatherFailureBody();
          }
        },
      ),
    );
  }
}
