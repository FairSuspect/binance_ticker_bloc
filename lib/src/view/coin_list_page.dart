import 'package:auto_route/auto_route.dart';
import 'package:binance_ticker_bloc/src/helpers/string_formatter.dart';
import 'package:binance_ticker_bloc/src/services/routing/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/binance_bloc.dart';
import '../model/coin.dart';

class CoinListPage extends StatelessWidget {
  const CoinListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => BinanceBloc()..add(BinanceFetch()),
        ),
      ],
      child: const Scaffold(
        body: _Body(),
        floatingActionButton: _FAB(),
      ),
    );
  }
}

class _FAB extends StatelessWidget {
  const _FAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.refresh),
      onPressed: () {
        BlocProvider.of<BinanceBloc>(context).add(BinanceFetch());
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BinanceBloc, BinanceState>(
      builder: (context, state) {
        if (state is BinanceLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BinanceLoaded) {
          return CustomScrollView(
            slivers: [
              const _AppBar(),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => _CoinTile(coin: state.coins[index]),
                      childCount: state.coins.length))
            ],
          );
        }
        if (state is BinanceError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Произошла ошибка во время загрузки списка коинов"),
                if (kDebugMode) Text(state.message)
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text("Тикеры"),
    );
  }
}

class _CoinTile extends StatelessWidget {
  const _CoinTile({required this.coin});
  final Coin coin;
  @override
  Widget build(BuildContext context) {
    try {
      final targetCoin = coin.targetCoin;
      final baseCoin = coin.baseCoin;
      return ListTile(
        onTap: () {
          context.router.push(
            CoinDetailsRoute(coin: coin),
          );
          // BlocProvider.of<DailyCoinBloc>(context).started(coin.symbol);
        },
        leading: Image.network(
          height: 32,
          'https://coinicons-api.vercel.app/api/icon/${baseCoin.toLowerCase()}',
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.monetization_on),
        ),
        title: Text(coin.symbol),
        trailing: Text("${coin.price.excludeZeroes} $targetCoin"),
      );
    } catch (e) {
      return ListTile(
        onTap: () {
          context.router.push(
            CoinDetailsRoute(coin: coin),
          );
        },
        leading: const Icon(Icons.monetization_on),
        title: Text(coin.symbol),
        trailing: Text(coin.price.excludeZeroes),
      );
    }
  }
}
