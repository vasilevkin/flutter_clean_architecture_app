import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/app/constants.dart';
import 'package:flutter_clean_architecture_app/core/presentation/widgets/tab_navigation_item.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/presentation/screens/number_trivia_screen.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/presentation/screens/weather_search_screen.dart';

class ScreensList {
  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          title: Constants.number,
          icon: Icons.confirmation_number,
          screen: NumberTriviaScreen(),
        ),
        TabNavigationItem(
          title: Constants.weather,
          icon: Icons.wb_sunny,
          screen: WeatherSearchScreen(),
        ),
        TabNavigationItem(
          title: Constants.cat,
          icon: Icons.category,
          screen: WeatherSearchScreen(),
        ),
      ];
}
