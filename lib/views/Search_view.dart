// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        // backgroundColor: Colors.blueGrey,
        title: const Text(
          'My Weather App ',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              GetWeatherCubit getWeatherCubit =
                  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(value);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              hintText: 'search city',
              label: const Text(
                'search',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: 24),
                child: Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                    //  color: Colors.blueGrey,
                    ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                    //   color: Colors.blueGrey,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
