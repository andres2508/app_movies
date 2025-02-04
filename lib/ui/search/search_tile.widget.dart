import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  final TMDBEntity entity;

  const SearchTile({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    final accessToken = GlobalMovieConfiguration.controller.accessToken;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: 130,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              height: size.height * 0.2,
              width: 130,
              imageUrl: entity.posterUrl(),
              placeholder: (_, __) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (_, __, ___) => Icon(Icons.error),
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
    );
  }
}
