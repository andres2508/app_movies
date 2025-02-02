import 'package:dio/dio.dart';

abstract class HttpAuthorityStrategy {
  final String authority;
  final List<Interceptor> _interceptors;
  final bool isDjangoBack;

  HttpAuthorityStrategy({required this.authority, this.isDjangoBack = true})
      : _interceptors = [] {
    interceptorsInitialize();
  }

  List<Interceptor> get interceptors => _interceptors;

  HttpAuthorityStrategy addInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
    return this;
  }

  void interceptorsInitialize();
}
