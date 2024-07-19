class WeatherModel {
  final String cityName;
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final double avgTemp;
  final String weatherCondition;
  final String image;

  const WeatherModel({
    required this.minTemp,
    required this.maxTemp,
    required this.weatherCondition,
    required this.image,
    required this.cityName,
    required this.avgTemp,
    required this.date,
  });
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
