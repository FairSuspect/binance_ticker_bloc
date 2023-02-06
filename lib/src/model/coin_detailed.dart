import 'package:freezed_annotation/freezed_annotation.dart';

import '../helpers/coins.dart';

part 'coin_detailed.freezed.dart';
part 'coin_detailed.g.dart';

@freezed
class CoinDetailed with _$CoinDetailed {
  const CoinDetailed._();

  const factory CoinDetailed({
    required final String symbol,
    // @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
    required final String lastPrice,
    @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
        required final double priceChangePercent,
  }) = _CoinDetailed;

  factory CoinDetailed.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailedFromJson(json);

  static List<CoinDetailed> listFromJson(List list) =>
      list.map((e) => CoinDetailed.fromJson(e)).toList();

  String get targetCoin {
    var targetCoinIndex = -1;
    for (final coin in targetCoins) {
      var lastIndexOf = symbol.lastIndexOf(coin);
      if (lastIndexOf > 0) {
        targetCoinIndex = lastIndexOf;
        break;
      }
    }
    if (targetCoinIndex == -1) {
      throw Exception("Неизвестный токен $symbol");
    }
    return symbol.substring(targetCoinIndex);
  }

  String get baseCoin => symbol.substring(0, symbol.indexOf(targetCoin));
}

double _stringToDouble(String? number) =>
    number == null ? 0.0 : double.tryParse(number) ?? 0.0;
String _stringFromDouble(double number) => number.toString();
