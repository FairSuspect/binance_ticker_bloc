import 'package:bloc/bloc.dart';
import 'package:binance_ticker_bloc/src/model/coin_detailed.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'daily_coin_event.dart';
part 'daily_coin_state.dart';
part 'daily_coin_bloc.freezed.dart';

class DailyCoinBloc extends Bloc<DailyCoinEvent, DailyCoinState> {
  DailyCoinBloc() : super(const _Initial()) {
    on<DailyCoinEvent>((event, emit) async {
      emit(const DailyCoinState.loading());
      final state = await event.when(
        started: started,
      );

      emit(state);
    });
  }

  Future<DailyCoinState> started(String symbol) async {
    final dio = GetIt.instance.get<Dio>();
    const path = 'v3/ticker/24hr';
    final queryParams = {
      'symbol': symbol,
    };
    try {
      final response = await dio.get(path, queryParameters: queryParams);
      return DailyCoinState.loaded(CoinDetailed.fromJson(response.data));
    } on DioError catch (e) {
      return DailyCoinState.error(symbol, e);
    }
  }
}
