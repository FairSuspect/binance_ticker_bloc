part of 'daily_coin_bloc.dart';

@freezed
class DailyCoinEvent with _$DailyCoinEvent {
  const factory DailyCoinEvent.started({required final String symbol}) =
      _Started;
}
