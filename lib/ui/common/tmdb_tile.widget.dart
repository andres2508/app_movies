import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:app_movies/utils/fluro.utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TMDBTile extends StatelessWidget {
  final TMDBEntity entity;

  const TMDBTile({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    final accessToken = GlobalMovieConfiguration.controller.accessToken;
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => entity.isMovie()
          ? context.go('/movie/${entity.id}')
          : context.go('/series/${entity.id}'),
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: size.height * 0.34,
                imageUrl: entity.posterUrl(),
                placeholder: (_, __) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (_, __, ___) =>
                    Icon(Icons.error, color: Colors.white),
                httpHeaders: {'Authorization': 'Bearer $accessToken'},
              ),
            ),
            Flexible(
              child: Text(
                entity.getName(),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
