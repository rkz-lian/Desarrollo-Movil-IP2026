import 'package:flutter/material.dart';
import 'presentation/screen/home_screen.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CounterApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 7).theme(),
      home: HomeScreen(),
    );
  }
}
