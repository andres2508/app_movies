import 'package:app_movies/framework/dialog/dialogs.service.dart';
import 'package:app_movies/framework/messages/messages.service.dart';
import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Infrastructure Services
  serviceLocator.registerSingleton(MessagesService());
  serviceLocator.registerSingleton(DialogsService());
  serviceLocator.registerSingleton(FluroRouter());
}
