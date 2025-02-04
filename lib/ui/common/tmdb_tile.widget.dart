import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/ui/common/web_image.widget.dart';
import 'package:app_movies/utils/fluro.utils.dart';
import 'package:flutter/material.dart';

class TMDBTile extends StatelessWidget {
  final TMDBEntity entity;

  const TMDBTile({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
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
              child: WebImage(
                path: entity.posterUrl(),
                height: size.height * 0.34,
                width: size.width,
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
