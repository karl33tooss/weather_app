import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:go_router/go_router.dart';
import '../../logic/weather_cubit.dart';
import '../../logic/weather_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Контролер для поля введення тексту (щоб ми могли дістати текст, який ввів юзер)
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose(); // Обов'язково чистимо пам'ять
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 1. BlocProvider: Створює Cubit і тримає його в пам'яті, поки екран живе
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Weather App")),
        
        // BlocBuilder слухає зміни в WeatherCubit
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // --- ПОЛЕ ВВОДУ ---
                  TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      hintText: 'Введіть місто (напр. Lviv)',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // --- КНОПКА ПОШУКУ ---
                  ElevatedButton(
                    onPressed: () {
                      final city = _cityController.text;
                      if (city.isNotEmpty) {
                        // Звертаємось до Cubit і кажемо "Вантаж!"
                        // context.read<WeatherCubit>() знаходить найближчий Cubit у дереві
                        context.read<WeatherCubit>().loadWeather(city);
                      }
                    },
                    child: const Text("Дізнатись погоду"),
                  ),
                  
                  const SizedBox(height: 30),

                  // --- РЕЗУЛЬТАТ (Змінюється залежно від стану) ---
                  
                  // `state.when` — це магія Freezed. 
                  // Вона змушує нас обробити ВСІ 4 варіанти подій.
                  state.when(
                    initial: () => const Text(
                      "Введіть місто, щоб побачити погоду",
                      textAlign: TextAlign.center,
                    ),
                    
                    loading: () => const CircularProgressIndicator(),
                    
                    error: (error) => Text(
                      "Помилка: $error",
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    
                    success: (weather) => Column(
                      children: [
                        Text(
                          weather.name,
                          style: const TextStyle(
                            fontSize: 32, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "${weather.main.temp.toStringAsFixed(1)}°C",
                          style: const TextStyle(fontSize: 48),
                        ),
                        Text(
                          weather.weather.first.description,
                          style: const TextStyle(fontSize: 24, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}