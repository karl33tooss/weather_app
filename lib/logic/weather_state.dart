import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/forecast_model.dart'; // 👇 1. Імпорт змінився

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;
  
  // 👇 2. Тепер ми передаємо ForecastModel
  const factory WeatherState.success(ForecastModel forecast) = _Success;
  
  const factory WeatherState.error(String message) = _Error;
}