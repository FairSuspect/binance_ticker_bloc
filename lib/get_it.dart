import 'package:get_it/get_it.dart';

import 'src/services/dio.dart';

void setup() {
  final dio = setupDio();
  GetIt.instance.registerSingleton(dio);
}
