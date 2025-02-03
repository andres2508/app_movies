import 'package:app_movies/ui/common/chip.widget.dart';
import 'package:app_movies/ui/movie/detail/movie_detail.view.model.dart';
import 'package:app_movies/utils/theme.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailContent extends ConsumerWidget {
  const MovieDetailContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(movieDetailViewModelProvider).movie!;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: size.height * 0.35,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieDetail.title,
                style: context.textTheme().titleMedium,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                  children: movieDetail.genres
                      .map((it) => LabelChip(label: it.name))
                      .toList(growable: false),
                ),
              ),
              Text(
                movieDetail.overview,
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
