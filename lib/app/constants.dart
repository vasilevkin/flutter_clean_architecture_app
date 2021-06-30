class Constants {
  static const String appName = 'Clean Architecture app';
  static const String numberInputHint = 'Enter a number';
  static const String search = 'Search';
  static const String random = 'Get random trivia';
  static const String start = 'Start searching!';

  static const String number = 'Numbers';
  static const String weather = 'Weather';
  static const String cat = 'Cats';

  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';
  static const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
  static const String INVALID_INPUT_FAILURE_MESSAGE =
      'Invalid Input - The number must be a positive integer or zero.';
  static const String DEFAULT_FAILURE_MESSAGE = 'Unexpected error';

  static const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

  // Weather search
  static const String cityInputHint = 'Enter a city name';
  static const String randomCity = 'Get random city weather';
  static const String randomCityName = 'London';

  static const String CACHED_CITY_WEATHER = 'CACHED_CITY_WEATHER';

  static const String weatherHost = 'https://www.metaweather.com/';
  static const String weatherApi = '$weatherHost/api/location/';

  static const String emptyString = '** EMPTY **';
  static const int emptyInt = 999999999;
  static const double emptyDouble = 1111111111.11;

}
