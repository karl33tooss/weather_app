import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/weather_model.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  // 1. Стан спокою
  const factory WeatherState.initial() = _Initial;
  
  // 2. Стан завантаження
  const factory WeatherState.loading() = _Loading;
  
  // 3. Стан успіху (тримає в собі погоду)
  const factory WeatherState.success(WeatherModel weather) = _Success;
  
  // 4. Стан помилки (тримає текст помилки)
  const factory WeatherState.error(String message) = _Error;
}