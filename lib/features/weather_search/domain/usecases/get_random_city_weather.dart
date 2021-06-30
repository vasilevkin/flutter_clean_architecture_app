import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_app/core/data/error/failures.dart';
import 'package:flutter_clean_architecture_app/core/domain/usecases/usecase.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/entities/city_weather.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/repositories/city_weather_repository.dart';

class GetRandomCityWeather implements UseCase<CityWeather, NoParams> {
  final CityWeatherRepository repository;

  GetRandomCityWeather(this.repository);

  @override
  Future<Either<Failure, CityWeather>> call(NoParams params) async {
    return await repository.getRandomCityWeather();
  }
}
