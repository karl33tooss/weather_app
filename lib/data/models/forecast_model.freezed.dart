// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForecastModel {
  List<ForecastItem> get list; // Список прогнозів (кожні 3 години)
  City get city;

  /// Create a copy of ForecastModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForecastModelCopyWith<ForecastModel> get copyWith =>
      _$ForecastModelCopyWithImpl<ForecastModel>(
          this as ForecastModel, _$identity);

  /// Serializes this ForecastModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForecastModel &&
            const DeepCollectionEquality().equals(other.list, list) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list), city);

  @override
  String toString() {
    return 'ForecastModel(list: $list, city: $city)';
  }
}

/// @nodoc
abstract mixin class $ForecastModelCopyWith<$Res> {
  factory $ForecastModelCopyWith(
          ForecastModel value, $Res Function(ForecastModel) _then) =
      _$ForecastModelCopyWithImpl;
  @useResult
  $Res call({List<ForecastItem> list, City city});

  $CityCopyWith<$Res> get city;
}

/// @nodoc
class _$ForecastModelCopyWithImpl<$Res>
    implements $ForecastModelCopyWith<$Res> {
  _$ForecastModelCopyWithImpl(this._self, this._then);

  final ForecastModel _self;
  final $Res Function(ForecastModel) _then;

  /// Create a copy of ForecastModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? city = null,
  }) {
    return _then(_self.copyWith(
      list: null == list
          ? _self.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ForecastItem>,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
    ));
  }

  /// Create a copy of ForecastModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res> get city {
    return $CityCopyWith<$Res>(_self.city, (value) {
      return _then(_self.copyWith(city: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ForecastModel].
extension ForecastModelPatterns on ForecastModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ForecastModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForecastModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ForecastModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForecastModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ForecastModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForecastModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ForecastItem> list, City city)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForecastModel() when $default != null:
        return $default(_that.list, _that.city);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ForecastItem> list, City city) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForecastModel():
        return $default(_that.list, _that.city);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ForecastItem> list, City city)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForecastModel() when $default != null:
        return $default(_that.list, _that.city);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ForecastModel implements ForecastModel {
  const _ForecastModel(
      {required final List<ForecastItem> list, required this.city})
      : _list = list;
  factory _ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  final List<ForecastItem> _list;
  @override
  List<ForecastItem> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

// Список прогнозів (кожні 3 години)
  @override
  final City city;

  /// Create a copy of ForecastModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForecastModelCopyWith<_ForecastModel> get copyWith =>
      __$ForecastModelCopyWithImpl<_ForecastModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForecastModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForecastModel &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), city);

  @override
  String toString() {
    return 'ForecastModel(list: $list, city: $city)';
  }
}

/// @nodoc
abstract mixin class _$ForecastModelCopyWith<$Res>
    implements $ForecastModelCopyWith<$Res> {
  factory _$ForecastModelCopyWith(
          _ForecastModel value, $Res Function(_ForecastModel) _then) =
      __$ForecastModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<ForecastItem> list, City city});

  @override
  $CityCopyWith<$Res> get city;
}

/// @nodoc
class __$ForecastModelCopyWithImpl<$Res>
    implements _$ForecastModelCopyWith<$Res> {
  __$ForecastModelCopyWithImpl(this._self, this._then);

  final _ForecastModel _self;
  final $Res Function(_ForecastModel) _then;

  /// Create a copy of ForecastModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? list = null,
    Object? city = null,
  }) {
    return _then(_ForecastModel(
      list: null == list
          ? _self._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ForecastItem>,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
    ));
  }

  /// Create a copy of ForecastModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res> get city {
    return $CityCopyWith<$Res>(_self.city, (value) {
      return _then(_self.copyWith(city: value));
    });
  }
}

/// @nodoc
mixin _$ForecastItem {
  int get dt; // Час у форматі Unix (секунди)
  MainInfo get main; // Температура (беремо з weather_model.dart)
  List<WeatherInfo> get weather; // Опис (беремо з weather_model.dart)
  @JsonKey(name: 'dt_txt')
  String get dtTxt;

  /// Create a copy of ForecastItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForecastItemCopyWith<ForecastItem> get copyWith =>
      _$ForecastItemCopyWithImpl<ForecastItem>(
          this as ForecastItem, _$identity);

  /// Serializes this ForecastItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForecastItem &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other.weather, weather) &&
            (identical(other.dtTxt, dtTxt) || other.dtTxt == dtTxt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dt, main,
      const DeepCollectionEquality().hash(weather), dtTxt);

  @override
  String toString() {
    return 'ForecastItem(dt: $dt, main: $main, weather: $weather, dtTxt: $dtTxt)';
  }
}

/// @nodoc
abstract mixin class $ForecastItemCopyWith<$Res> {
  factory $ForecastItemCopyWith(
          ForecastItem value, $Res Function(ForecastItem) _then) =
      _$ForecastItemCopyWithImpl;
  @useResult
  $Res call(
      {int dt,
      MainInfo main,
      List<WeatherInfo> weather,
      @JsonKey(name: 'dt_txt') String dtTxt});

  $MainInfoCopyWith<$Res> get main;
}

/// @nodoc
class _$ForecastItemCopyWithImpl<$Res> implements $ForecastItemCopyWith<$Res> {
  _$ForecastItemCopyWithImpl(this._self, this._then);

  final ForecastItem _self;
  final $Res Function(ForecastItem) _then;

  /// Create a copy of ForecastItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
    Object? dtTxt = null,
  }) {
    return _then(_self.copyWith(
      dt: null == dt
          ? _self.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _self.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainInfo,
      weather: null == weather
          ? _self.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>,
      dtTxt: null == dtTxt
          ? _self.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ForecastItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainInfoCopyWith<$Res> get main {
    return $MainInfoCopyWith<$Res>(_self.main, (value) {
      return _then(_self.copyWith(main: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ForecastItem].
extension ForecastItemPatterns on ForecastItem {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ForecastItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForecastItem() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ForecastItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForecastItem():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ForecastItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForecastItem() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int dt, MainInfo main, List<WeatherInfo> weather,
            @JsonKey(name: 'dt_txt') String dtTxt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForecastItem() when $default != null:
        return $default(_that.dt, _that.main, _that.weather, _that.dtTxt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int dt, MainInfo main, List<WeatherInfo> weather,
            @JsonKey(name: 'dt_txt') String dtTxt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForecastItem():
        return $default(_that.dt, _that.main, _that.weather, _that.dtTxt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int dt, MainInfo main, List<WeatherInfo> weather,
            @JsonKey(name: 'dt_txt') String dtTxt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForecastItem() when $default != null:
        return $default(_that.dt, _that.main, _that.weather, _that.dtTxt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ForecastItem implements ForecastItem {
  const _ForecastItem(
      {required this.dt,
      required this.main,
      required final List<WeatherInfo> weather,
      @JsonKey(name: 'dt_txt') required this.dtTxt})
      : _weather = weather;
  factory _ForecastItem.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemFromJson(json);

  @override
  final int dt;
// Час у форматі Unix (секунди)
  @override
  final MainInfo main;
// Температура (беремо з weather_model.dart)
  final List<WeatherInfo> _weather;
// Температура (беремо з weather_model.dart)
  @override
  List<WeatherInfo> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

// Опис (беремо з weather_model.dart)
  @override
  @JsonKey(name: 'dt_txt')
  final String dtTxt;

  /// Create a copy of ForecastItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForecastItemCopyWith<_ForecastItem> get copyWith =>
      __$ForecastItemCopyWithImpl<_ForecastItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForecastItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForecastItem &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.dtTxt, dtTxt) || other.dtTxt == dtTxt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dt, main,
      const DeepCollectionEquality().hash(_weather), dtTxt);

  @override
  String toString() {
    return 'ForecastItem(dt: $dt, main: $main, weather: $weather, dtTxt: $dtTxt)';
  }
}

/// @nodoc
abstract mixin class _$ForecastItemCopyWith<$Res>
    implements $ForecastItemCopyWith<$Res> {
  factory _$ForecastItemCopyWith(
          _ForecastItem value, $Res Function(_ForecastItem) _then) =
      __$ForecastItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int dt,
      MainInfo main,
      List<WeatherInfo> weather,
      @JsonKey(name: 'dt_txt') String dtTxt});

  @override
  $MainInfoCopyWith<$Res> get main;
}

/// @nodoc
class __$ForecastItemCopyWithImpl<$Res>
    implements _$ForecastItemCopyWith<$Res> {
  __$ForecastItemCopyWithImpl(this._self, this._then);

  final _ForecastItem _self;
  final $Res Function(_ForecastItem) _then;

  /// Create a copy of ForecastItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
    Object? dtTxt = null,
  }) {
    return _then(_ForecastItem(
      dt: null == dt
          ? _self.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _self.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainInfo,
      weather: null == weather
          ? _self._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>,
      dtTxt: null == dtTxt
          ? _self.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ForecastItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainInfoCopyWith<$Res> get main {
    return $MainInfoCopyWith<$Res>(_self.main, (value) {
      return _then(_self.copyWith(main: value));
    });
  }
}

/// @nodoc
mixin _$City {
  String get name;
  String get country;

  /// Create a copy of City
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CityCopyWith<City> get copyWith =>
      _$CityCopyWithImpl<City>(this as City, _$identity);

  /// Serializes this City to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is City &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, country);

  @override
  String toString() {
    return 'City(name: $name, country: $country)';
  }
}

/// @nodoc
abstract mixin class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) _then) =
      _$CityCopyWithImpl;
  @useResult
  $Res call({String name, String country});
}

/// @nodoc
class _$CityCopyWithImpl<$Res> implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._self, this._then);

  final City _self;
  final $Res Function(City) _then;

  /// Create a copy of City
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [City].
extension CityPatterns on City {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_City value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _City() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_City value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _City():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_City value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _City() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, String country)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _City() when $default != null:
        return $default(_that.name, _that.country);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, String country) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _City():
        return $default(_that.name, _that.country);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name, String country)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _City() when $default != null:
        return $default(_that.name, _that.country);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _City implements City {
  const _City({required this.name, required this.country});
  factory _City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  @override
  final String name;
  @override
  final String country;

  /// Create a copy of City
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CityCopyWith<_City> get copyWith =>
      __$CityCopyWithImpl<_City>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _City &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, country);

  @override
  String toString() {
    return 'City(name: $name, country: $country)';
  }
}

/// @nodoc
abstract mixin class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) _then) =
      __$CityCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String country});
}

/// @nodoc
class __$CityCopyWithImpl<$Res> implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(this._self, this._then);

  final _City _self;
  final $Res Function(_City) _then;

  /// Create a copy of City
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? country = null,
  }) {
    return _then(_City(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
