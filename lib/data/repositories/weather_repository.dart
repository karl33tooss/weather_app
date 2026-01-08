import 'package:dio/dio.dart';
import '../../core/service_locator.dart'; // Наш "рюкзак" з getIt
import '../models/weather_model.dart';    // Наша модель даних

class WeatherRepository {
  // 1. Дістаємо нашого "кур'єра" Dio з рюкзака
  final Dio _dio = getIt<Dio>();

  // Метод отримання погоди. 
  // Future означає, що результат буде не миттєво (треба почекати інтернет).
  Future<WeatherModel> getWeather(String city) async {
    try {
      // 2. Робимо запит
      // base url ми вже налаштували в Dio, тому пишемо тільки кінцівку шляху '/weather'
      // q - це параметр запиту (query), який вимагає OpenWeatherMap для назви міста
      final response = await _dio.get(
        '/forecast',
        queryParameters: {'q': city},
      );

      // 3. Перевірка результату
      // response.data — це той самий JSON (Map<String, dynamic>)
      // Ми згодовуємо його нашій моделі
      return WeatherModel.fromJson(response.data);
      
    } catch (e) {
      // Якщо щось пішло не так (немає інтернету, місто не знайдено)
      // Ми поки просто викидаємо помилку далі. 
      // Пізніше ми навчимося обробляти це гарно.
      throw Exception('Failed to load weather: $e');
    }
  }
}