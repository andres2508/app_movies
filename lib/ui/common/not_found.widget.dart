import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/utils/fluro.utils.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:flutter/material.dart';

class ContentNotFound extends StatelessWidget {
  final String message;

  const ContentNotFound({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            color: ColorStyles.principal500,
            size: 150,
          ),
          Text(
            message,
          ),
          ElevatedButton(
            onPressed: () => context.pop(),
            child: Text(context.loc().go_back),
          )
        ],
      ),
    );
    ;
  }
}
