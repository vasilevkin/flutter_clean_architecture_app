import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_clean_architecture_app/core/data/network/network_info.dart';
import 'package:flutter_clean_architecture_app/core/data/util/input_converter.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/data/datasources/number_trivia_local_datasource.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/local/city_weather_local_datasource.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/remote/city_weather_remote_datasource.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/remote/weather_api_service.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/datasources/remote/weather_api_service_impl.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/data/repositories/city_weather_repo_impl.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/repositories/city_weather_repository.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/usecases/usecases.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //!! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());

  //!! Features
  //! Number Trivia

  // Use cases Number Trivia
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Repository Number Trivia
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources Number Trivia
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Bloc Number Trivia
  sl.registerFactory(
    () => NumberTriviaBloc(
      concrete: sl(),
      random: sl(),
      inputConverter: sl(),
    ),
  );

  //!! Features
  //! Weather search

  // Use cases Weather search
  sl.registerLazySingleton(() => GetConcreteCityWeather(sl()));
  sl.registerLazySingleton(() => GetRandomCityWeather(sl()));

  // Repository Weather search
  sl.registerLazySingleton<CityWeatherRepository>(
    () => CityWeatherRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources Weather search
  sl.registerLazySingleton<CityWeatherRemoteDataSource>(
    () => CityWeatherRemoteDataSourceImpl(api: sl()),
  );
  sl.registerLazySingleton<CityWeatherLocalDataSource>(
    () => CityWeatherLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // API Weather search
  sl.registerLazySingleton<WeatherApiService>(
    () => MetaWeatherApiServiceImpl(
      client: sl(),
    ),
  );

  // Bloc Weather search
  sl.registerFactory(
    () => WeatherSearchBloc(
      concrete: sl(),
      random: sl(),
      // inputConverter: sl(),
    ),
  );
}
