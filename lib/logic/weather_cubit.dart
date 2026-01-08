import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/weather_repository.dart';
import '../core/service_locator.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository = getIt<WeatherRepository>();

  WeatherCubit() : super(const WeatherState.initial());

  Future<void> loadWeather(String city) async {
    try {
      emit(const WeatherState.loading());

      // 👇 Викликаємо getForecast замість getWeather
      final forecast = await _repository.getForecast(city);

      // 👇 Передаємо прогноз у стан успіху
      emit(WeatherState.success(forecast));
      
    } catch (e) {
      emit(WeatherState.error(e.toString()));
    }
  }
}