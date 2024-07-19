import 'package:my_weather_app/models/weather_model.dart';

class WeatherStates {}

class NoWeatherState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;
  WeatherLoadedState({
    required this.weatherModel,
  });
}

class WeatherFailureState extends WeatherStates {}

class StillLoading extends WeatherStates {}
