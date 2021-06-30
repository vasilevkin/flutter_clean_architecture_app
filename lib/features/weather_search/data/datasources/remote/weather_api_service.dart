import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/remote/remote_models/remote_models.dart';

abstract class WeatherApiService {
  Future<RemoteCity> getCity(String text);

  Future<List<RemoteCity>> getCities(String name);

  Future<RemoteWeather> getWeather(RemoteCity city);

  Image getImage(String abbr);
}
