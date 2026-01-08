// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) =>
    _ForecastModel(
      list: (json['list'] as List<dynamic>)
          .map((e) => ForecastItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastModelToJson(_ForecastModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };

_ForecastItem _$ForecastItemFromJson(Map<String, dynamic> json) =>
    _ForecastItem(
      dt: (json['dt'] as num).toInt(),
      main: MainInfo.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String,
    );

Map<String, dynamic> _$ForecastItemToJson(_ForecastItem instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'dt_txt': instance.dtTxt,
    };

_City _$CityFromJson(Map<String, dynamic> json) => _City(
      name: json['name'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$CityToJson(_City instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
    };

_Wind _$WindFromJson(Map<String, dynamic> json) => _Wind(
      speed: (json['speed'] as num).toDouble(),
    );

Map<String, dynamic> _$WindToJson(_Wind instance) => <String, dynamic>{
      'speed': instance.speed,
    };
