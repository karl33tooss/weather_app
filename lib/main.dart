import 'package:flutter/material.dart';
import 'core/router.dart'; // Імпортуємо наш файл з налаштуваннями

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Зверни увагу: .router
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
      ),
      // Ось тут ми підключаємо наш конфіг
      routerConfig: router,
    );
  }
}