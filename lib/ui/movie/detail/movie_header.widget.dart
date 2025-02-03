import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/ui/common/chip.widget.dart';
import 'package:app_movies/ui/movie/detail/movie_detail.view.model.dart';
import 'package:app_movies/ui/movie/detail/rating.widget.dart';
import 'package:app_movies/utils/date.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailHeader extends ConsumerWidget {
  const MovieDetailHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final found = ref.watch(movieDetailViewModelProvider).movie!;
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
          LabelChip(
            label: TMDBDateUtils.shortFormat(found.releaseDate),
            color: ColorStyles.principal400,
            textColor: ColorStyles.dark400,
          ),
          RatingScore(
            voteAverage: found.voteAverage,
            voteCount: found.voteCount,
          )
        ],
      ),
    );
  }
}
