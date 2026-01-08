import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/router.dart';
import 'core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Weather App',
      theme: ThemeData(
        // <--- ВСТАНОВЛЮЄМО ШРИФТ ДЛЯ ВСЬОГО ДОДАТКА
        textTheme: GoogleFonts.montserratTextTheme(),
        primarySwatch: Colors.blue,
      ),
    );
  }
}