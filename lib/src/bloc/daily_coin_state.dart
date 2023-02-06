part of 'daily_coin_bloc.dart';

@freezed
class DailyCoinState with _$DailyCoinState {
  const factory DailyCoinState.initial() = _Initial;
  const factory DailyCoinState.loading() = _Loading;
  const factory DailyCoinState.loaded(CoinDetailed coin) = _Loaded;
  const factory DailyCoinState.error(String symbol, Exception error) = _Error;
}
