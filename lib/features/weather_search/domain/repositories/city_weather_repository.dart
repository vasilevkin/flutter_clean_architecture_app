import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_app/core/data/error/failures.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/entities/city_weather.dart';

abstract class CityWeatherRepository {
  Future<Either<Failure, CityWeather>> getConcreteCityWeatherFor(String name);

  Future<Either<Failure, CityWeather>> getRandomCityWeather();
}
