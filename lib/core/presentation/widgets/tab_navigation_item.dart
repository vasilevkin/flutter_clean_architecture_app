import 'package:flutter/cupertino.dart';

class TabNavigationItem {
  final String title;
  final IconData icon;
  final Widget screen;

  TabNavigationItem({
    required this.title,
    required this.icon,
    required this.screen,
  });
}
