// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    CoinListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CoinListPage(),
      );
    },
    CoinDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CoinDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CoinDetailsPage(
          key: args.key,
          coin: args.coin,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          CoinListRoute.name,
          path: '/',
        ),
        RouteConfig(
          CoinDetailsRoute.name,
          path: 'coin/:symbol',
        ),
      ];
}

/// generated route for
/// [CoinListPage]
class CoinListRoute extends PageRouteInfo<void> {
  const CoinListRoute()
      : super(
          CoinListRoute.name,
          path: '/',
        );

  static const String name = 'CoinListRoute';
}

/// generated route for
/// [CoinDetailsPage]
class CoinDetailsRoute extends PageRouteInfo<CoinDetailsRouteArgs> {
  CoinDetailsRoute({
    Key? key,
    required Coin coin,
  }) : super(
          CoinDetailsRoute.name,
          path: 'coin/:symbol',
          args: CoinDetailsRouteArgs(
            key: key,
            coin: coin,
          ),
        );

  static const String name = 'CoinDetailsRoute';
}

class CoinDetailsRouteArgs {
  const CoinDetailsRouteArgs({
    this.key,
    required this.coin,
  });

  final Key? key;

  final Coin coin;

  @override
  String toString() {
    return 'CoinDetailsRouteArgs{key: $key, coin: $coin}';
  }
}
