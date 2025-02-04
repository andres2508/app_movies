import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:flutter/material.dart';

class RatingScore extends StatelessWidget {
  final double voteAverage;
  final int voteCount;

  const RatingScore(
      {required this.voteAverage, required this.voteCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.star_rounded, color: ColorStyles.principal400),
        Text(
          voteAverage.toStringAsPrecision(3),
          style: TextStyle(
            color: ColorStyles.principal400,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          context.loc().reviews_count(voteCount),
        )
      ],
    );
  }
}
