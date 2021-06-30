import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_app/app/constants.dart';
import 'package:flutter_clean_architecture_app/core/data/error/failures.dart';
import 'package:flutter_clean_architecture_app/core/domain/usecases/usecase.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/entities/city_weather.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/usecases/usecases.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/presentation/bloc/bloc.dart';

class WeatherSearchBloc extends Bloc<WeatherSearchEvent, WeatherSearchState> {
  final GetConcreteCityWeather getConcreteCityWeather;
  final GetRandomCityWeather getRandomWeather;

  WeatherSearchBloc({
    required GetConcreteCityWeather concrete,
    required GetRandomCityWeather random,
  })  : getConcreteCityWeather = concrete,
        getRandomWeather = random,
        super(Initial());

  @override
  Stream<WeatherSearchState> mapEventToState(WeatherSearchEvent event) async* {
    if (event is GetWeatherForConcreteCity) {
      yield Loading();
      final failureOrWeather =
          await getConcreteCityWeather(Params(name: event.nameString));
      yield* _eitherLoadedOrErrorState(failureOrWeather);
    } else if (event is GetWeatherForRandomSearch) {
      yield Loading();
      final failureOrWeather = await getRandomWeather(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrWeather);
    }
  }

  Stream<WeatherSearchState> _eitherLoadedOrErrorState(
      Either<Failure, CityWeather> failureOrWeather) async* {
    yield failureOrWeather.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (weather) => Success(cityWeather: weather),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return Constants.CACHE_FAILURE_MESSAGE;
      default:
        return Constants.DEFAULT_FAILURE_MESSAGE;
    }
  }
}
