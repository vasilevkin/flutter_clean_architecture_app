import 'package:equatable/equatable.dart';

class CityWeather extends Equatable {
  final String cityName;
  final double temperature;

  CityWeather({required this.cityName, required this.temperature});

  @override
  List<Object> get props => [cityName, temperature];
}
