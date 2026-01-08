import 'package:dio/dio.dart';
import '../../core/service_locator.dart';
import '../models/forecast_model.dart'; // Імпортуємо нову модель!

class WeatherRepository {
  final Dio _dio = getIt<Dio>();

  // Змінили назву методу і тип повернення на ForecastModel
  Future<ForecastModel> getForecast(String city) async {
    try {
      // Змінили URL з '/weather' на '/forecast'
      final response = await _dio.get(
        '/forecast',
        queryParameters: {'q': city},
      );

      return ForecastModel.fromJson(response.data);
      
    } catch (e) {
      throw Exception('Failed to load forecast: $e');
    }
  }
}