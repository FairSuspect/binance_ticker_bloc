import 'package:binance_ticker_bloc/get_it.dart' as get_it;
import 'package:flutter/material.dart';

import 'src/services/routing/app_router.dart';

void main() {
  get_it.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
