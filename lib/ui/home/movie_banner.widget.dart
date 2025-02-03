import 'package:app_movies/domain/movie/model/movie.model.dart';
import 'package:app_movies/ui/common/movie_tile.widget.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:app_movies/utils/theme.utils.dart';
import 'package:flutter/material.dart';

class MovieBanner extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback onSeeAll;

  const MovieBanner(
      {required this.title,
      required this.movies,
      required this.onSeeAll,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.44,
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textTheme().titleMedium,
              ),
              TextButton(
                onPressed: onSeeAll,
                child: Text(context.loc().view_all),
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => MovieTile(movie: movies[index]),
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemCount: movies.length,
            ),
          )
        ],
      ),
    );
  }
}
