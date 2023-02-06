// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../helpers/coins.dart';

part 'coin.freezed.dart';
part 'coin.g.dart';

@freezed
class Coin with _$Coin {
  const Coin._();

  const factory Coin({
    required final String symbol,
    // @JsonKey(fromJson: _stringToDouble, toJson: _stringFromDouble)
    required final String price,
  }) = _Coin;

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  static List<Coin> listFromJson(List list) =>
      list.map((e) => Coin.fromJson(e)).toList();

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
