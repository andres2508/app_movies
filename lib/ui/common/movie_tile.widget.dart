import 'package:app_movies/domain/movie/model/movie.model.dart';
import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:app_movies/utils/fluro.utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final accessToken = GlobalMovieConfiguration.controller.accessToken;
    return InkWell(
      onTap: () => context.go('/movie/${movie.id}'),
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: movie.posterUrl(),
                placeholder: (_, __) => CircularProgressIndicator(),
                errorWidget: (_, __, ___) => Icon(Icons.error),
                httpHeaders: {'Authorization': 'Bearer $accessToken'},
              ),
            ),
            Flexible(
              child: Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
