import 'package:freezed_annotation/freezed_annotation.dart';
import 'weather_model.dart'; 

part 'forecast_model.freezed.dart';
part 'forecast_model.g.dart';

@freezed
abstract class ForecastModel with _$ForecastModel {
  const factory ForecastModel({
    required List<ForecastItem> list,
    required City city,
  }) = _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => 
      _$ForecastModelFromJson(json);
}

@freezed
abstract class ForecastItem with _$ForecastItem {
  const factory ForecastItem({
    required int dt,
    required MainInfo main,
    required List<WeatherInfo> weather,
    required Wind wind, // <--- ДОДАЛИ ВІТЕР
    @JsonKey(name: 'dt_txt') required String dtTxt,
  }) = _ForecastItem;

  factory ForecastItem.fromJson(Map<String, dynamic> json) => 
      _$ForecastItemFromJson(json);
}

@freezed
abstract class City with _$City {
  const factory City({
    required String name,
    required String country,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => 
      _$CityFromJson(json);
}

@freezed
abstract class Wind with _$Wind {
  const factory Wind({
    required double speed,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => 
      _$WindFromJson(json);
}