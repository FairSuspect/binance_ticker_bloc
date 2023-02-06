// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_detailed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinDetailed _$$_CoinDetailedFromJson(Map<String, dynamic> json) =>
    _$_CoinDetailed(
      symbol: json['symbol'] as String,
      lastPrice: json['lastPrice'] as String,
      priceChangePercent:
          _stringToDouble(json['priceChangePercent'] as String?),
    );

Map<String, dynamic> _$$_CoinDetailedToJson(_$_CoinDetailed instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'lastPrice': instance.lastPrice,
      'priceChangePercent': _stringFromDouble(instance.priceChangePercent),
    };
