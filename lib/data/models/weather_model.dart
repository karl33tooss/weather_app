import 'package:freezed_annotation/freezed_annotation.dart';

// Цей рядок каже: "Цей файл — частина згенерованого коду"
part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

// --- ГОЛОВНИЙ КЛАС ПОГОДИ ---
@freezed
abstract class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String name, // Назва міста
    required MainInfo main, // Блок з температурою
    required List<WeatherInfo> weather, // Блок з описом (список)
  }) = _WeatherModel;

  // Цей метод дозволяє створювати об'єкт з JSON
  factory WeatherModel.fromJson(Map<String, dynamic> json) => 
      _$WeatherModelFromJson(json);
}

// --- ВЛОЖЕНІ КЛАСИ (Температура) ---
@freezed
abstract class MainInfo with _$MainInfo {
  const factory MainInfo({
    required double temp, // Температура
    @JsonKey(name: 'feels_like') required double feelsLike, // Відчувається як
    required int humidity,
  }) = _MainInfo;

  factory MainInfo.fromJson(Map<String, dynamic> json) => 
      _$MainInfoFromJson(json);
}

// --- ВКЛАДЕНІ КЛАСИ (Опис: хмарно, дощ...) ---
@freezed
abstract class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    required String description, // Текстовий опис
    required String icon, // Код іконки (напр. '01d')
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) => 
      _$WeatherInfoFromJson(json);
}