import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:flutter/material.dart';

class NoContentAvailable extends StatelessWidget {
  const NoContentAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.warning_rounded,
          color: ColorStyles.principal500,
          size: 60,
        ),
        Text(context.loc().no_content_available)
      ],
    );
  }
}
