// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_weather_app/helpers/get_matrial_color_function.dart';
import 'package:my_weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            getColorTheme(weather.weatherCondition),
            getColorTheme(weather.weatherCondition).shade400,
            getColorTheme(weather.weatherCondition).shade300,
            getColorTheme(weather.weatherCondition).shade200,
            getColorTheme(weather.weatherCondition).shade100,
            getColorTheme(weather.weatherCondition).shade50,
            getColorTheme(weather.weatherCondition).shade50,
            getColorTheme(weather.weatherCondition).shade50,
            getColorTheme(weather.weatherCondition).shade50,

            getColorTheme(weather.weatherCondition).shade100,
            getColorTheme(weather.weatherCondition).shade200,
            getColorTheme(weather.weatherCondition).shade300,
            getColorTheme(weather.weatherCondition).shade400,
            getColorTheme(weather.weatherCondition),

            //  getColorTheme(weather.weatherCondition).shade50,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            weather.cityName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated ${weather.date.hour} : ${weather.date.minute} ',
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Spacer(),
              Image.network('https:${weather.image}'),
              const Spacer(),
              Text(
                weather.avgTemp.round().toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    'min temp : ${weather.minTemp.round().toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'max temp : ${weather.maxTemp.round().toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
          const SizedBox(height: 24),
          Text(
            weather.weatherCondition,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
