class CIATAuthorizationException implements Exception {
  String error;

  CIATAuthorizationException(this.error);

  @override
  String toString() => error;
}

class CIATAuthenticationException implements Exception {
  String error;

  CIATAuthenticationException(this.error);

  @override
  String toString() => error;
}

class CIATExpiredSessionException implements Exception {}
