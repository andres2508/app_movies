import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:dio/dio.dart';

class AuthenticationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = GlobalMovieConfiguration.controller.accessToken;
    options.headers['Authorization'] = 'Bearer $accessToken';
    return super.onRequest(options, handler);
  }
}
