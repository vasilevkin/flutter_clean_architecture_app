import 'package:flutter_clean_architecture_app/app/constants.dart';

class RemoteWeather {
  int id;
  String weatherStateName;
  String weatherStateAbbr;
  String windDirectionCompass;
  DateTime created;
  DateTime applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  num humidity;
  double visibility;
  int predictability;

  RemoteWeather({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  factory RemoteWeather.empty() => RemoteWeather(
        id: Constants.emptyInt,
        weatherStateName: Constants.emptyString,
        weatherStateAbbr: Constants.emptyString,
        windDirectionCompass: Constants.emptyString,
        created: DateTime.now(),
        applicableDate: DateTime.now(),
        minTemp: Constants.emptyDouble,
        maxTemp: Constants.emptyDouble,
        theTemp: Constants.emptyDouble,
        windSpeed: Constants.emptyDouble,
        windDirection: Constants.emptyDouble,
        airPressure: Constants.emptyDouble,
        humidity: Constants.emptyDouble,
        visibility: Constants.emptyDouble,
        predictability: Constants.emptyInt,
      );

  factory RemoteWeather.fromJson(Map<String, dynamic> json) => RemoteWeather(
        id: json["id"] ?? Constants.emptyInt,
        weatherStateName: json["weather_state_name"] ?? Constants.emptyString,
        weatherStateAbbr: json["weather_state_abbr"] ?? Constants.emptyString,
        windDirectionCompass:
            json["wind_direction_compass"] ?? Constants.emptyString,
        created: DateTime.parse(json["created"] ?? DateTime.now()),
        applicableDate:
            DateTime.parse(json["applicable_date"] ?? DateTime.now()),
        minTemp: json["min_temp"].toDouble() ?? Constants.emptyDouble,
        maxTemp: json["max_temp"].toDouble() ?? Constants.emptyDouble,
        theTemp: json["the_temp"].toDouble() ?? Constants.emptyDouble,
        windSpeed: json["wind_speed"].toDouble() ?? Constants.emptyDouble,
        windDirection:
            json["wind_direction"].toDouble() ?? Constants.emptyDouble,
        airPressure: json["air_pressure"] ?? Constants.emptyDouble,
        humidity: json["humidity"] ?? Constants.emptyDouble,
        visibility: json["visibility"].toDouble() ?? Constants.emptyDouble,
        predictability: json["predictability"] ?? Constants.emptyInt,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created.toIso8601String(),
        "applicable_date":
            "${applicableDate.year.toString().padLeft(4, '0')}-${applicableDate.month.toString().padLeft(2, '0')}-${applicableDate.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
      };

  @override
  String toString() {
    return 'Weather{id: $id, weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, windDirectionCompass: $windDirectionCompass, created: $created, applicableDate: $applicableDate, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, windSpeed: $windSpeed, windDirection: $windDirection, airPressure: $airPressure, humidity: $humidity, visibility: $visibility, predictability: $predictability}';
  }
}
