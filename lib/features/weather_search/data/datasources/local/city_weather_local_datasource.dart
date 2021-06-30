import 'dart:convert';

import 'package:flutter_clean_architecture_app/app/constants.dart';
import 'package:flutter_clean_architecture_app/core/data/error/exceptions.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/models/city_weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CityWeatherLocalDataSource {
  Future<CityWeatherModel> getLastCityWeather();

  Future<void> cacheCityWeather(CityWeatherModel cityWeatherToCache);

  Future<void> addCityWeatherToCache({
    required String searchString,
    required CityWeatherModel cityWeatherToCache,
  });

  Future<CityWeatherModel> getCityWeatherByName(String name);
}

class CityWeatherLocalDataSourceImpl implements CityWeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  CityWeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheCityWeather(CityWeatherModel cityWeatherToCache) {
    return sharedPreferences.setString(
      Constants.CACHED_CITY_WEATHER,
      json.encode(cityWeatherToCache.toJson()),
    );
  }

  @override
  Future<CityWeatherModel> getLastCityWeather() {
    final jsonString =
        sharedPreferences.getString(Constants.CACHED_CITY_WEATHER);

    if (jsonString != null) {
      return Future.value(
        CityWeatherModel.fromJson(json.decode(jsonString)),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> addCityWeatherToCache({
    required String searchString,
    required CityWeatherModel cityWeatherToCache,
  }) {
    return sharedPreferences.setString(
      searchString,
      json.encode(cityWeatherToCache.toJson()),
    );
  }

  @override
  Future<CityWeatherModel> getCityWeatherByName(String name) {
    final jsonString = sharedPreferences.getString(name);

    if (jsonString != null) {
      return Future.value(
        CityWeatherModel.fromJson(json.decode(jsonString)),
      );
    } else {
      throw CacheException();
    }
  }
}
