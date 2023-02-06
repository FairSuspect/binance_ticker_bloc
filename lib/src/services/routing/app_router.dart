import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../model/coin.dart';
import '../../view/coin_details_page.dart';
import '../../view/coin_list_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: CoinListPage, initial: true, children: []),
    AutoRoute(page: CoinDetailsPage, path: 'coin/:symbol'),
  ],
)
class AppRouter extends _$AppRouter {}
