import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/domain/entities/city_weather.dart';

class WeatherDisplay extends StatelessWidget {
  final CityWeather cityWeather;

  WeatherDisplay({required this.cityWeather});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          Text(
            cityWeather.temperature.toString(),
            style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Center(
            child: SingleChildScrollView(
              child: Text(
                cityWeather.cityName,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
