import 'package:freezed_annotation/freezed_annotation.dart';
import 'weather_model.dart'; // Імпортуємо наші старі класи (MainInfo, WeatherInfo)

part 'forecast_model.freezed.dart';
part 'forecast_model.g.dart';

// --- ГОЛОВНИЙ КЛАС ПРОГНОЗУ ---
@freezed
abstract class ForecastModel with _$ForecastModel {
  const factory ForecastModel({
    required List<ForecastItem> list, // Список прогнозів (кожні 3 години)
    required City city,               // Інформація про місто
  }) = _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => 
      _$ForecastModelFromJson(json);
}

// --- ОДИН ЕЛЕМЕНТ ПРОГНОЗУ (наприклад, на 15:00) ---
@freezed
abstract class ForecastItem with _$ForecastItem {
  const factory ForecastItem({
    required int dt,              // Час у форматі Unix (секунди)
    required MainInfo main,       // Температура (беремо з weather_model.dart)
    required List<WeatherInfo> weather, // Опис (беремо з weather_model.dart)
    @JsonKey(name: 'dt_txt') required String dtTxt, // Читабельна дата "2023-10-10 15:00:00"
  }) = _ForecastItem;

  factory ForecastItem.fromJson(Map<String, dynamic> json) => 
      _$ForecastItemFromJson(json);
}

// --- ІНФОРМАЦІЯ ПРО МІСТО ---
@freezed
abstract class City with _$City {
  const factory City({
    required String name,
    required String country,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => 
      _$CityFromJson(json);
}