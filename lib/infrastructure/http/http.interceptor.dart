import 'package:app_movies/framework/failure.model.dart';
import 'package:dio/dio.dart';

class HttpContentTypeInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json; charset=utf-8';
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    throw Failure.of(err.message ?? err.type.name);
  }
}
