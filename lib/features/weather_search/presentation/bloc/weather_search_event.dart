import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherSearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetWeatherForConcreteCity extends WeatherSearchEvent {
  final String nameString;

  GetWeatherForConcreteCity(this.nameString);

  @override
  List<Object> get props => [nameString];
}

class GetWeatherForRandomSearch extends WeatherSearchEvent {}
