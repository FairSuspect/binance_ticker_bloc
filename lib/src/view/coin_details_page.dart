import 'package:binance_ticker_bloc/src/helpers/string_formatter.dart';
import 'package:binance_ticker_bloc/src/model/coin_detailed.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/daily_coin_bloc.dart';
import '../model/coin.dart';

class CoinDetailsPage extends StatelessWidget {
  const CoinDetailsPage({super.key, required this.coin});
  final Coin coin;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DailyCoinBloc()..add(DailyCoinEvent.started(symbol: coin.symbol)),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(title: Text(coin.symbol)),
          body: const _Body(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<DailyCoinBloc>(context)
                  .add(DailyCoinEvent.started(symbol: coin.symbol));
            },
          ),
        );
      }),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyCoinBloc, DailyCoinState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _Loading(),
          loading: () => const _Loading(),
          loaded: (coin) => _Loaded(coin: coin),
          error: (symbol, error) => _Error(
            exception: error,
            symbol: symbol,
          ),
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _Loaded extends StatelessWidget {
  const _Loaded({required this.coin});

  final CoinDetailed coin;

  @override
  Widget build(BuildContext context) {
    final percent =
        NumberFormat("+ ###.##;- ###.##").format(coin.priceChangePercent);
    // final price =
    //     NumberFormat("###,###,###,###.##############").format(coin.lastPrice);
    final theme = Theme.of(context);
    late final Widget icon;
    try {
      final baseCoin = coin.baseCoin;
      icon = Image.network(
        height: 64,
        'https://coinicons-api.vercel.app/api/icon/${baseCoin.toLowerCase()}',
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.monetization_on, size: 64),
      );
    } catch (e) {
      icon = const Icon(Icons.monetization_on);
    }

    late final String price;

    try {
      price = "${coin.lastPrice.excludeZeroes} ${coin.targetCoin}";
    } catch (e) {
      price = coin.lastPrice.excludeZeroes;
    }
    return Column(
      children: [
        icon,
        Text(coin.symbol),
        ListTile(
          leading: const Icon(Icons.monetization_on),
          title: const Text("Цена"),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(price),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.price_change),
          title: const Text("Изменение цены"),
          trailing: Text(
            "$percent %",
            style: TextStyle(
                color: coin.priceChangePercent.isNegative
                    ? theme.colorScheme.error
                    : Colors.green),
          ),
        ),
      ],
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({required this.exception, required this.symbol});
  final String symbol;
  final Exception exception;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Произошла неизвестная ошибка"),
          const SizedBox(
            height: 16,
          ),
          if (kDebugMode) Text(exception.toString()),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<DailyCoinBloc>(context).started(symbol);
              },
              child: const Text("Повторить попытку")),
        ],
      ),
    );
  }
}
