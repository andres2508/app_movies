import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/ui/common/chip.widget.dart';
import 'package:app_movies/ui/common/rating.widget.dart';
import 'package:app_movies/utils/date.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TMDBDetailHeader extends ConsumerWidget {
  final DateTime? releaseDate;
  final double voteAverage;
  final int voteCount;

  const TMDBDetailHeader(
      {required this.releaseDate,
      required this.voteAverage,
      required this.voteCount,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            ColorStyles.dark500,
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          releaseDate != null
              ? LabelChip(
                  label: TMDBDateUtils.shortFormat(releaseDate!),
                  color: ColorStyles.principal400,
            textColor: ColorStyles.dark400,
                )
              : SizedBox.shrink(),
          RatingScore(
            voteAverage: voteAverage,
            voteCount: voteCount,
          )
        ],
      ),
    );
  }
}
