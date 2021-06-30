import 'package:flutter_clean_architecture_app/features/weather_search/domain/entities/city_weather.dart';

class CityWeatherModel extends CityWeather {
  CityWeatherModel({
    required String cityName,
    required double temperature,
  }) : super(cityName: cityName, temperature: temperature);

  factory CityWeatherModel.fromJson(Map<String, dynamic> json) {
    return CityWeatherModel(
      cityName: json['city_name'],
      temperature: (json['temperature'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city_name': cityName,
      'temperature': temperature,
    };
  }
}
