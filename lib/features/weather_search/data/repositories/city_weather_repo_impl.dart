import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_app/core/data/error/exceptions.dart';
import 'package:flutter_clean_architecture_app/core/data/error/failures.dart';
import 'package:flutter_clean_architecture_app/core/data/network/network_info.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/local/city_weather_local_datasource.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/remote/city_weather_remote_datasource.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/models/city_weather_model.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/entities/city_weather.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/repositories/city_weather_repository.dart';

typedef Future<CityWeatherModel> _ConcreteOrRandomChooser();

class CityWeatherRepositoryImpl implements CityWeatherRepository {
  final CityWeatherRemoteDataSource remoteDataSource;
  final CityWeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CityWeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CityWeather>> getConcreteCityWeatherFor(
      String name) async {
    return await _getCityWeather(() {
      return remoteDataSource.getWeatherForCity(name);
    });
  }

  @override
  Future<Either<Failure, CityWeather>> getRandomCityWeather() async {
    return await _getCityWeather(() {
      return remoteDataSource.getRandomCityWeather();
    });
  }

  Future<Either<Failure, CityWeather>> _getCityWeather(
    _ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      // TODO: cache all not random weather and add cache expire time
      try {
        final cityWeather = await getConcreteOrRandom();
        localDataSource.cacheCityWeather(cityWeather);
        return Right(cityWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCityWeather = await localDataSource.getLastCityWeather();
        return Right(localCityWeather);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
