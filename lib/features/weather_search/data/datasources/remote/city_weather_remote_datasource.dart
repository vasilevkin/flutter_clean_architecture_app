import 'package:flutter_clean_architecture_app/app/constants.dart';
import 'package:flutter_clean_architecture_app/core/data/error/exceptions.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/remote/remote_models/remote_models.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/remote/weather_api_service.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/models/city_weather_model.dart';

abstract class CityWeatherRemoteDataSource {
  Future<CityWeatherModel> getWeatherForCity(String name);

  Future<CityWeatherModel> getRandomCityWeather();
}

class CityWeatherRemoteDataSourceImpl implements CityWeatherRemoteDataSource {
  final WeatherApiService api;

  CityWeatherRemoteDataSourceImpl({required this.api});

  @override
  Future<CityWeatherModel> getRandomCityWeather() => _getCityWeatherForName();

  @override
  Future<CityWeatherModel> getWeatherForCity(String name) =>
      _getCityWeatherForName(name: name);

  Future<CityWeatherModel> _getCityWeatherForName({String? name}) async {
    try {
      final RemoteCity city =
          await _fetchCityWeatherByName(name ?? Constants.randomCityName);
      return CityWeatherModel(
          cityName: city.name, temperature: city.weather.theTemp);
    } catch (error) {
      //TODO: show errors in ui
      throw ServerException();
    }
  }

  Future<RemoteCity> _fetchCityWeatherByName(String name) async {
    RemoteCity cityWithoutWeather = await api.getCity(name);
    RemoteWeather weather = await api.getWeather(cityWithoutWeather);
    RemoteCity city = RemoteCity(
      name: cityWithoutWeather.name,
      woeId: cityWithoutWeather.woeId,
      weather: weather,
    );

    return city;
  }
}
