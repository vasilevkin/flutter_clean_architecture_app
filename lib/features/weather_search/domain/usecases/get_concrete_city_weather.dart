import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_app/core/data/error/failures.dart';
import 'package:flutter_clean_architecture_app/core/domain/usecases/usecase.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/entities/city_weather.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/repositories/city_weather_repository.dart';

class GetConcreteCityWeather implements UseCase<CityWeather, Params> {
  final CityWeatherRepository repository;

  GetConcreteCityWeather(this.repository);

  @override
  Future<Either<Failure, CityWeather>> call(Params params) async {
    return await repository.getConcreteCityWeatherFor(params.name);
  }
}

class Params extends Equatable {
  final String name;

  Params({required this.name});

  @override
  List<Object> get props => [name];
}
