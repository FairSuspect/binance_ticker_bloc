// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_detailed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoinDetailed _$CoinDetailedFromJson(Map<String, dynamic> json) {
  return _CoinDetailed.fromJson(json);
}

/// @nodoc
mixin _$CoinDetailed {
  String get symbol =>
      throw _privateConstructorUsedError; // @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
  String get lastPrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
  double get priceChangePercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinDetailedCopyWith<CoinDetailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinDetailedCopyWith<$Res> {
  factory $CoinDetailedCopyWith(
          CoinDetailed value, $Res Function(CoinDetailed) then) =
      _$CoinDetailedCopyWithImpl<$Res, CoinDetailed>;
  @useResult
  $Res call(
      {String symbol,
      String lastPrice,
      @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
          double priceChangePercent});
}

/// @nodoc
class _$CoinDetailedCopyWithImpl<$Res, $Val extends CoinDetailed>
    implements $CoinDetailedCopyWith<$Res> {
  _$CoinDetailedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? lastPrice = null,
    Object? priceChangePercent = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      lastPrice: null == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as String,
      priceChangePercent: null == priceChangePercent
          ? _value.priceChangePercent
          : priceChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoinDetailedCopyWith<$Res>
    implements $CoinDetailedCopyWith<$Res> {
  factory _$$_CoinDetailedCopyWith(
          _$_CoinDetailed value, $Res Function(_$_CoinDetailed) then) =
      __$$_CoinDetailedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol,
      String lastPrice,
      @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
          double priceChangePercent});
}

/// @nodoc
class __$$_CoinDetailedCopyWithImpl<$Res>
    extends _$CoinDetailedCopyWithImpl<$Res, _$_CoinDetailed>
    implements _$$_CoinDetailedCopyWith<$Res> {
  __$$_CoinDetailedCopyWithImpl(
      _$_CoinDetailed _value, $Res Function(_$_CoinDetailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? lastPrice = null,
    Object? priceChangePercent = null,
  }) {
    return _then(_$_CoinDetailed(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      lastPrice: null == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as String,
      priceChangePercent: null == priceChangePercent
          ? _value.priceChangePercent
          : priceChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoinDetailed extends _CoinDetailed {
  const _$_CoinDetailed(
      {required this.symbol,
      required this.lastPrice,
      @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
          required this.priceChangePercent})
      : super._();

  factory _$_CoinDetailed.fromJson(Map<String, dynamic> json) =>
      _$$_CoinDetailedFromJson(json);

  @override
  final String symbol;
// @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
  @override
  final String lastPrice;
  @override
  @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
  final double priceChangePercent;

  @override
  String toString() {
    return 'CoinDetailed(symbol: $symbol, lastPrice: $lastPrice, priceChangePercent: $priceChangePercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoinDetailed &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.lastPrice, lastPrice) ||
                other.lastPrice == lastPrice) &&
            (identical(other.priceChangePercent, priceChangePercent) ||
                other.priceChangePercent == priceChangePercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, symbol, lastPrice, priceChangePercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoinDetailedCopyWith<_$_CoinDetailed> get copyWith =>
      __$$_CoinDetailedCopyWithImpl<_$_CoinDetailed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoinDetailedToJson(
      this,
    );
  }
}

abstract class _CoinDetailed extends CoinDetailed {
  const factory _CoinDetailed(
      {required final String symbol,
      required final String lastPrice,
      @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
          required final double priceChangePercent}) = _$_CoinDetailed;
  const _CoinDetailed._() : super._();

  factory _CoinDetailed.fromJson(Map<String, dynamic> json) =
      _$_CoinDetailed.fromJson;

  @override
  String get symbol;
  @override // @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
  String get lastPrice;
  @override
  @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
  double get priceChangePercent;
  @override
  @JsonKey(ignore: true)
  _$$_CoinDetailedCopyWith<_$_CoinDetailed> get copyWith =>
      throw _privateConstructorUsedError;
}
