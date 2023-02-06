import 'package:dio/dio.dart';

Dio setupDio() {
  return Dio(BaseOptions(
    baseUrl: 'https://api.binance.com/api/',
  ))
    ..interceptors.add(DebugInterceptor());
}

class DebugInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        '[${response.requestOptions.method}] ${response.requestOptions.path} - ${response.statusCode} (${response.statusMessage})');
    super.onResponse(response, handler);
  }
}
