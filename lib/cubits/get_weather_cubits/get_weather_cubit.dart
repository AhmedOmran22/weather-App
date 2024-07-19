// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:my_weather_app/models/weather_model.dart';
import 'package:my_weather_app/services/weather_Service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  WeatherModel? weatherModel;
  GetWeatherCubit() : super(NoWeatherState());
  getWeather(String cityName) async {
    try {
      emit(StillLoading());
      weatherModel =
          await WeatherService(Dio()).getCurruntWeather(city: cityName);

      emit(
        WeatherLoadedState(
          weatherModel: weatherModel!,
        ),
      );
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
