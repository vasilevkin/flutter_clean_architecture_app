import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/entities/city_weather.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherSearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends WeatherSearchState {}

class Loading extends WeatherSearchState {}

class Success extends WeatherSearchState {
  final CityWeather cityWeather;

  Success({required this.cityWeather});

  @override
  List<Object> get props => [cityWeather];
}

class Error extends WeatherSearchState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
