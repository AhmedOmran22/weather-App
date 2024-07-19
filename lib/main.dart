// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:my_weather_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:my_weather_app/helpers/get_matrial_color_function.dart';
import 'package:my_weather_app/views/Home_View.dart';

void main() {
  runApp(const My_Weather_App());
}

class My_Weather_App extends StatelessWidget {
  const My_Weather_App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  useMaterial3: false,
                  primarySwatch: getColorTheme(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}
