import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/app/constants.dart';
import 'package:flutter_clean_architecture_app/core/presentation/screens/home_screen.dart';

class CleanArchitectureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(Constants.appName),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
