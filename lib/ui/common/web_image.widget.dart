import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WebImage extends StatelessWidget {
  final String path;
  final double height;
  final double width;
  final bool showProgress;

  const WebImage(
      {required this.path,
      required this.height,
      required this.width,
      this.showProgress = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    final accessToken = GlobalMovieConfiguration.controller.accessToken;
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.fill,
      imageUrl: path,
      errorWidget: (_, __, ___) => Icon(Icons.error, color: Colors.white),
      progressIndicatorBuilder: (_, __, ___) {
        return showProgress
            ? Center(child: CircularProgressIndicator())
            : SizedBox.shrink();
      },
      httpHeaders: {'Authorization': 'Bearer $accessToken'},
    );
  }
}
