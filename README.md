# binance_ticker_bloc

# Архитектура 

В приложении для управления состоянием используется BloC.
+ Для списка коинов используется BinanceBloc
+ Для экрана с подробностями отдельного тикера используется DailyCoinBloc
В основном в BloC используются три состояния - "Loading", "Loaded", "Error". 
Для реализации DailyCoinEvent использовался freezed.

Для запросов в апи использовался dio. Его инстанс вынесен в service-locator get_it.

Для всех дата моделей использовался freezed. В тикерах не всегда очевидно где в тикере начинается код отдельной валюты, то в геттерах у моделей монеты применялись примерные значения для отображения сивола криптовалюты и валюты расчетов.

Для отображения символов криптовалюты использовался https://coinicons-api.vercel.app/. Решение не самое надежное, так как внешнего, но другого не дано.

Навигация выполнена с помощью auto_route и состоит из двух экранов:
+ CoinListPage - список тикеров
+ CoinDetailsPage - страница с полробностями тикера

Приложение устойчиво к падениям api бинанса, ошибок загрузки иконок, а так же к ошибкам парсинга моент из тикера.

# Запуск

Для запуска можно воспользоваться инструментами флаттера

`flutter run` или через IDE

В качесвте альтернативы можно установить apk файл на устройство.
apk-файлы лежат в папке build:
+ build/app/outputs/apk/release/app-release.apk  - релизная версия
+ build/app/outputs/apk/debug/app-debug.apk - дебаг версия

apk можно перебилдитьс помощью команды flutter build apk




## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
