// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:my_weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String _baseUrl = 'http://api.weatherapi.com/v1';
  final String _apiKey = 'c73e27a6bcea407db2f233656240905';
  const WeatherService(this.dio);

 

  Future<WeatherModel> getCurruntWeather({required String city}) async {
    try {
      final Response response = await dio.get(
        '$_baseUrl/forecast.json?key=$_apiKey&q=$city&days=10',
      );

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Opps there was an error please try again later';
      throw Exception(errMessage);
    } catch (e) {
      throw Exception('OOPS');
    }
  }
}
// http://api.weatherapi.com/v1/forecast.json?key=c73e27a6bcea407db2f233656240905&q=london&days=10