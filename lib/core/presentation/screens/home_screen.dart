import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/core/data/datasources/screens_list.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          for (final tabItem in ScreensList.items) tabItem.screen,
        ],
      ),
      bottomNavigationBar: _makeBottomNavigationBar(),
    );
  }

  BottomNavigationBar _makeBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      items: [
        for (final tabItem in ScreensList.items)
          BottomNavigationBarItem(
            icon: Icon(tabItem.icon),
            label: tabItem.title,
          ),
      ],
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
