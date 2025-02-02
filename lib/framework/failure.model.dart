import 'dart:io';

class Failure {
  late String message;

  Failure({required this.message});

  Failure.of(this.message);

  Failure.ofException(Exception e) {
    if (e is SocketException) {
      message = 'Error de conexión. Verifique que tenga acceso a internet';
    }
  }

  @override
  String toString() => message;
}

class EntityNotFoundException implements Exception {
  final String? message;

  EntityNotFoundException() : message = null;

  EntityNotFoundException.withMessage(this.message);

  @override
  String toString() {
    return "Entity not found exception: $message";
  }
}
