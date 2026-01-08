import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart'; // Для форматування дати
import '../../data/models/forecast_model.dart';

class ForecastReportScreen extends StatelessWidget {
  final ForecastModel forecast;

  const ForecastReportScreen({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    // 1. Фільтруємо список: беремо лише один прогноз на день (щоб не було 8 рядків на один день)
    // Логіка: беремо кожен 8-й елемент або той, що в середині дня.
    // Простий варіант: групуємо по днях.
    final dailyForecasts = _getDailyForecasts(forecast.list);

    return Scaffold(
      backgroundColor: const Color(0xFF303345), // Темний фон як на макеті
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // КНОПКА НАЗАД і ЗАГОЛОВОК
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(), // Повертаємось назад
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Next 5 Days",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),

              // СПИСОК ДНІВ
              Expanded(
                child: ListView.separated(
                  itemCount: dailyForecasts.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    final item = dailyForecasts[index];
                    final date = DateTime.fromMillisecondsSinceEpoch(item.dt * 1000);
                    final dayName = DateFormat('EEEE').format(date); // "Monday"
                    final fullDate = DateFormat('MMM, d').format(date); // "Oct, 10"

                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1), // Напівпрозорий блок
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Ліва частина: День і Дата
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dayName, 
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
                                ),
                                Text(
                                  fullDate, 
                                  style: const TextStyle(color: Colors.grey, fontSize: 14)
                                ),
                              ],
                            ),
                          ),
                          
                          // Центр: Температура
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${item.main.temp.round()}°",
                              style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),

                          // Права частина: Іконка
                          Image.network(
                            "https://openweathermap.org/img/wn/${item.weather.first.icon}.png",
                            width: 50,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Проста логіка фільтрації: беремо один прогноз на кожен унікальний день
  List<ForecastItem> _getDailyForecasts(List<ForecastItem> list) {
    final Map<String, ForecastItem> uniqueDays = {};
    
    for (var item in list) {
      final date = DateTime.fromMillisecondsSinceEpoch(item.dt * 1000);
      final dayKey = "${date.year}-${date.month}-${date.day}";
      
      // Якщо цього дня ще немає в списку - додаємо.
      // (Оскільки API сортує за часом, ми візьмемо найраніший доступний прогноз на цей день,
      // або можна ускладнити логіку і шукати саме 12:00, але для старту цього досить).
      
      // Покращення: якщо ми знайшли запис ближче до 12:00 - замінюємо ним.
      if (!uniqueDays.containsKey(dayKey)) {
        uniqueDays[dayKey] = item;
      } else {
         // Якщо у нас вже є запис на цей день, але поточний item ближче до 15:00, беремо його
         if (date.hour == 15) {
            uniqueDays[dayKey] = item;
         }
      }
    }
    
    return uniqueDays.values.toList();
  }
}