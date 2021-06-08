import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/app/app.dart';
import 'package:flutter_clean_architecture_app/app/injection_container.dart'
    as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(CleanArchitectureApp());
}
