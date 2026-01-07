import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/weather_repository.dart';
import '../core/service_locator.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  // Дістаємо репозиторій з рюкзака
  final WeatherRepository _repository = getIt<WeatherRepository>();

  // Стартуємо зі стану "Initial"
  WeatherCubit() : super(const WeatherState.initial());

  // Головна функція: Завантажити погоду
  Future<void> loadWeather(String city) async {
    try {
      // 1. Кажемо UI: "Покажи крутилку"
      emit(const WeatherState.loading());

      // 2. Просимо дані у репозиторія
      final weather = await _repository.getWeather(city);

      // 3. Якщо все ок — кажемо: "Покажи погоду"
      emit(WeatherState.success(weather));
      
    } catch (e) {
      // 4. Якщо помилка — кажемо: "Покажи помилку"
      emit(WeatherState.error(e.toString()));
    }
  }
}