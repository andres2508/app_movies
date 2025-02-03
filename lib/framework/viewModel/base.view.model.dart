import 'package:app_movies/framework/failure.model.dart';
import 'package:app_movies/framework/messages/messages.service.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:flutter/cupertino.dart';

enum NotifierState { initial, loading, loaded }

abstract class BaseViewModel extends ChangeNotifier {
  final MessagesService _messagesService = serviceLocator<MessagesService>();
  NotifierState _state = NotifierState.initial;
  Failure? _failure;

  NotifierState get state => _state;

  Failure? get failure => _failure;

  bool get hasError => failure != null;

  bool get isLoading => state == NotifierState.loading;

  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  void loadStarted() {
    _setState(NotifierState.loading);
  }

  void loadEnded() {
    _setState(NotifierState.loaded);
  }

  void setFailure(Failure failure, StackTrace stacktrace) {
    // ToDo: catch errors and report, example Crashlytics
    // Report to user view
    debugPrint("Error in base view model \n$failure \n$stacktrace");
    _failure = failure;
  }

  void _resetFailure() {
    _failure = null;
  }

  Future<dynamic> run(Function body) async {
    try {
      _resetFailure();
      loadStarted();
      return await body.call();
    } catch (e, stacktrace) {
      setFailure(Failure.of(e.toString()), stacktrace);
    } finally {
      loadEnded();
    }
  }

  Future<dynamic> runWithHandlingError(Function body) async {
    try {
      _resetFailure();
      loadStarted();
      return await body.call();
    } catch (e, stacktrace) {
      setFailure(Failure.of(e.toString()), stacktrace);
      _messagesService.fireError(e.toString());
    } finally {
      loadEnded();
    }
  }
}
