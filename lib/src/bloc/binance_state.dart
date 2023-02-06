part of 'binance_bloc.dart';

@immutable
abstract class BinanceState {
  const BinanceState();
}

class BinanceInitial extends BinanceState {
  const BinanceInitial();
}

class BinanceLoaded extends BinanceState {
  const BinanceLoaded(this.coins);

  final List<Coin> coins;
}

class BinanceLoading extends BinanceState {
  const BinanceLoading();
}

class BinanceError extends BinanceState {
  final String message;
  const BinanceError(this.message);
}
