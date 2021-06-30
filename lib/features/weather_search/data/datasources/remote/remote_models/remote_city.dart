import 'package:flutter_clean_architecture_app/app/constants.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/remote/remote_models/remote_weather.dart';

class RemoteCity {
  final String name;
  final int woeId;
  final RemoteWeather weather;

  RemoteCity({
    required this.name,
    required this.woeId,
    required this.weather,
  });

  factory RemoteCity.fromJson(Map<String, dynamic> map) {
    final weathers = map['weathers'];
    return RemoteCity(
        name: map['title'] ?? Constants.emptyString,
        woeId: map['woeid'] ?? Constants.emptyInt,
        weather: weathers != null
            ? (weathers as List)
                .map((e) => RemoteWeather.fromJson(e))
                .toList()
                .first
            : RemoteWeather.empty()
        // RemoteWeather
        );
  }

  Map<String, dynamic> toJson() => {
        "title": name,
        "woeid": woeId,
        "weather": weather.toJson(),
      };

  RemoteCity fromWeather(RemoteWeather weather) {
    return RemoteCity(
      name: name,
      woeId: woeId,
      weather: weather,
    );
  }

  @override
  String toString() {
    return 'City{name: $name, woeId: $woeId, weather: $weather}';
  }
}
