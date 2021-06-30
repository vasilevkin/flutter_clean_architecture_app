import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/app/constants.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/remote/remote_models/remote_models.dart';
import 'package:http/http.dart' as http;

import 'weather_api_service.dart';

class MetaWeatherApiServiceImpl implements WeatherApiService {
  final http.Client client;

  MetaWeatherApiServiceImpl({required this.client});

  @override
  Future<RemoteCity> getCity(String name) async {
    final cities = await getCities(name);
    return cities.first;
  }

  @override
  Future<List<RemoteCity>> getCities(String name) async {
    final url = '${Constants.weatherApi}search/?query=$name';
    final response = await http.get(Uri.parse(url));
    final body = Utf8Decoder().convert(response.bodyBytes);
    final data = jsonDecode(body) as List;
    final cities = data.map((e) => RemoteCity.fromJson(e)).toList();
    return cities;
  }

  @override
  Future<RemoteWeather> getWeather(RemoteCity city) async {
    final url = '${Constants.weatherApi}${city.woeId}';
    final response = await http.get(Uri.parse(url));
    final body = Utf8Decoder().convert(response.bodyBytes);
    final data = jsonDecode(body);
    final weatherData = data['consolidated_weather'] as List;
    final weatherList =
        weatherData.map((e) => RemoteWeather.fromJson(e)).toList();
    return weatherList.first;
  }

  @override
  Image getImage(String abbr) {
    return Image.network(
      '${Constants.weatherHost}static/img/weather/png/64/$abbr.png',
    );
  }
}
