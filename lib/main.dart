import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Вимикаємо стрічку "Debug" у правому верхньому куті
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: Scaffold(
        body: Center(
          child: Text("Weather App Setup Complete"),
        ),
      ),
    );
  }
}