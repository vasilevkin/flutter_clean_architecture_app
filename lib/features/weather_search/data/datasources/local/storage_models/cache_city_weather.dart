import 'package:flutter_clean_architecture_app/features/weather_search/data/models/city_weather_model.dart';

class CacheCityWeather {
  DateTime timestamp;
  String searchString;
  CityWeatherModel cityWeatherModel;

  CacheCityWeather({
    required this.timestamp,
    required this.searchString,
    required this.cityWeatherModel,
  });

  factory CacheCityWeather.fromJson(Map<String, dynamic> json) {
    return CacheCityWeather(
      timestamp: json['timestamp'],
      searchString: json['search_string'],
      cityWeatherModel: json['city_weather_model'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'search_string': searchString,
      'city_weather_model': cityWeatherModel,
    };
  }
}
