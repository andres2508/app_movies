import 'package:app_movies/framework/viewModel/view.model.consumer.dart';
import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/ui/movie/detail/movie_content.widget.dart';
import 'package:app_movies/ui/movie/detail/movie_detail.view.model.dart';
import 'package:app_movies/ui/movie/detail/movie_header.widget.dart';
import 'package:app_movies/utils/fluro.utils.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailView extends ConsumerStatefulWidget {
  final int movieId;

  const MovieDetailView({required this.movieId, super.key});

  @override
  ConsumerState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends ConsumerState<MovieDetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(movieDetailViewModelProvider.notifier)
          .loadRequired(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(movieDetailViewModelProvider);
    final accessToken = GlobalMovieConfiguration.controller.accessToken;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ViewModelConsumer(
        provider: model,
        builder: (_, __) {
          return model.hasMovie
              ? SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.65,
                        width: size.width,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: model.movie!.posterUrl(),
                          errorWidget: (_, __, ___) => Icon(Icons.error),
                          httpHeaders: {'Authorization': 'Bearer $accessToken'},
                        ),
                      ),
                      _backButton(),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: size.height * 0.45,
                        child: MovieDetailHeader(),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: size.height * 0.64,
                        child: MovieDetailContent(),
                      ),
                    ],
                  ),
                )
              : _movieNotFound();
        },
      ),
    );
  }

  Widget _movieNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            color: ColorStyles.principal500,
            size: 150,
          ),
          Text(
            context.loc().movie_not_found,
          )
        ],
      ),
    );
  }

  Widget _backButton() {
    return Positioned(
      top: 25,
      left: 5,
      child: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back_rounded,
          color: ColorStyles.secondary500,
          size: 40,
        ),
      ),
    );
  }
}
