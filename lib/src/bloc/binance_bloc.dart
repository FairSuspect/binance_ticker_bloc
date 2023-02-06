import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../model/coin.dart';

part 'binance_event.dart';
part 'binance_state.dart';

class BinanceBloc extends Bloc<BinanceEvent, BinanceState> {
  BinanceBloc() : super(const BinanceInitial()) {
    on<BinanceFetch>(fetch);
  }
}

Future<void> fetch(BinanceEvent event, Emitter<BinanceState> emit) async {
  final dio = GetIt.instance.get<Dio>();
  const path = 'v3/ticker/price';
  try {
    emit(const BinanceLoading());
    final response = await dio.get(path);

    final List<Coin> results = Coin.listFromJson(response.data);

    emit(BinanceLoaded(results));
  } catch (e) {
    // Вместо нормального логгирования
    print(e);
    emit(BinanceError(e.toString()));
    rethrow;
  }
}
