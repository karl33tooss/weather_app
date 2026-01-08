import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../logic/weather_cubit.dart';
import '../../logic/weather_state.dart';
import '../../data/models/forecast_model.dart'; // Не забудь цей імпорт!

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();

  // Допоміжна функція для отримання дня тижня (щоб не тягнути бібліотеку intl)
  String _getDateString(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${weekdays[date.weekday - 1]}, ${date.day} ${months[date.month - 1]}';
  }

  // Час (наприклад, 15:00)
  String _getTimeString(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.hour.toString().padLeft(2, '0')}:00';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..loadWeather('Lviv'), // Вантажимо Львів одразу
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(Icons.menu, color: Colors.white), // Іконка меню (декор)
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Тут можна відкрити діалог пошуку, але поки залишимо кнопку
                if (_cityController.text.isNotEmpty) {
                  // Логіка пошуку буде тут
                }
              },
            ),
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            // 1. Фон (Градієнт)
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFEE3BC), Color(0xFFF39876)], // Кольори як на скріншоті (персикові)
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: state.when(
                  initial: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
                  loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
                  error: (msg) => Center(child: Text("Error: $msg", style: const TextStyle(color: Colors.white))),
                  
                  // ГОЛОВНИЙ ЕКРАН ПРИ УСПІХУ
                  success: (forecast) {
                    final current = forecast.list.first; // Поточна погода (перша в списку)
                    final city = forecast.city;

                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ПОШУК (Тимчасовий, щоб міняти міста)
                            TextField(
                              controller: _cityController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'Change city...',
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.check, color: Colors.black),
                                  onPressed: () => context.read<WeatherCubit>().loadWeather(_cityController.text),
                                ),
                              ),
                              onSubmitted: (val) => context.read<WeatherCubit>().loadWeather(val),
                            ),

                            const SizedBox(height: 20),

                            // 1. МІСТО І ДАТА
                            Text(
                              city.name,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF303345), // Темно-синій текст
                              ),
                            ),
                            Text(
                              _getDateString(current.dt),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF9A938C), // Сірий текст
                              ),
                            ),

                            const SizedBox(height: 30),

                            // 2. ВЕЛИКА КАРТКА (Сонце/Хмари + Температура)
                            Center(
                              child: Column(
                                children: [
                                  // Картинка (беремо з інтернету)
                                  Image.network(
                                    "https://openweathermap.org/img/wn/${current.weather.first.icon}@4x.png",
                                    width: 180,
                                    height: 180,
                                  ),
                                  Text(
                                    "${current.main.temp.round()}°",
                                    style: const TextStyle(
                                      fontSize: 90,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF303345),
                                    ),
                                  ),
                                  Text(
                                    current.weather.first.description.toUpperCase(),
                                    style: const TextStyle(fontSize: 20, color: Color(0xFF303345)),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 40),

                            // 3. ДЕТАЛІ (Вітер, Вологість, Відчувається)
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildDetailItem(Icons.water_drop, "${current.main.feelsLike.round()}°", "Feels like"),
                                  _buildDetailItem(Icons.air, "Wind", "? m/s"), // OpenWeatherMap в main не дає вітер, треба додати в модель, але поки заглушка
                                  _buildDetailItem(Icons.cloud, "${current.weather.first.description}", "Sky"),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),

                            // 4. ЗАГОЛОВОК "Today"
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Today",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF303345)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // ТУТ БУДЕ ПЕРЕХІД НА ЕКРАН 7 ДНІВ
                                    // context.push('/details');
                                  },
                                  child: const Text("Next 5 Days >", style: TextStyle(color: Color(0xFFE05959))),
                                )
                              ],
                            ),

                            const SizedBox(height: 10),

                            // 5. ГОРИЗОНТАЛЬНИЙ СПИСОК (Найближчі години)
                            SizedBox(
                              height: 140,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5, // Покажемо 5 наступних прогнозів
                                itemBuilder: (context, index) {
                                  final item = forecast.list[index + 1]; // +1, бо 0-й це "зараз"
                                  return Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: index == 0 
                                          ? const Color(0xFFE05959) // Активний елемент (червоний)
                                          : Colors.white.withOpacity(0.4), // Інші (прозорі)
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.white.withOpacity(0.5)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${item.main.temp.round()}°",
                                          style: TextStyle(
                                            fontSize: 18, 
                                            fontWeight: FontWeight.bold,
                                            color: index == 0 ? Colors.white : const Color(0xFF303345),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Image.network(
                                          "https://openweathermap.org/img/wn/${item.weather.first.icon}.png",
                                          width: 40,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          _getTimeString(item.dt),
                                          style: TextStyle(
                                            color: index == 0 ? Colors.white70 : const Color(0xFF9A938C),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Віджет для маленької деталі (іконка + текст)
  Widget _buildDetailItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF303345)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(color: Color(0xFF9A938C), fontSize: 12)),
      ],
    );
  }
}