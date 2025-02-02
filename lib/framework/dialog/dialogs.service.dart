import 'package:app_movies/framework/messages/message.dart';
import 'package:app_movies/framework/messages/messages.service.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:app_movies/utils/fluro.utils.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:flutter/material.dart';

class DialogsService with MessagesListener {
  BuildContext? _context;
  bool _isProgressVisible = false;

  DialogsService() {
    serviceLocator<MessagesService>().addListener(this);
  }

  void _hideProgress() {
    if (_isProgressVisible) {
      _isProgressVisible = false;
      _context!.pop();
    }
  }

  void _showDialog(String title, Message msg) {
    _hideProgress();
    showDialog(
      context: _context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg.text),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () => _context!.pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  void onError(Message message) {
    _showDialog(_context?.loc().unexpected_error ?? 'Unexpected error', message);
  }

  @override
  void onInfo(Message message) {
    _showDialog(_context?.loc().information ?? 'Information', message);
  }

  @override
  void onWarning(Message message) {
    _showDialog(_context?.loc().warning ?? 'Warning', message);
  }

  void changeContext(BuildContext context) {
    _context = context;
  }
}
