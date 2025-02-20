import 'package:app_movies/framework/viewModel/view.model.consumer.dart';
import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/ui/common/info_content.widget.dart';
import 'package:app_movies/ui/common/movie_header.widget.dart';
import 'package:app_movies/ui/common/not_found.widget.dart';
import 'package:app_movies/ui/common/web_image.widget.dart';
import 'package:app_movies/ui/movie/detail/movie_detail.view.model.dart';
import 'package:app_movies/utils/fluro.utils.dart';
import 'package:app_movies/utils/locale.utils.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ViewModelConsumer(
        provider: model,
        builder: (_, __) {
          final movie = model.movie;
          return model.hasMovie
              ? SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Stack(
                    children: [
                      WebImage(
                        path: model.movie!.posterUrl(),
                        height: size.height * 0.65,
                        width: size.width,
                      ),
                      _backButton(),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: size.height * 0.45,
                        child: TMDBDetailHeader(
                          releaseDate: movie!.releaseDate,
                          voteAverage: movie.voteAverage,
                          voteCount: movie.voteCount,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: size.height * 0.64,
                        child: DetailInfoContent(
                          title: movie.title,
                          overview: movie.overview,
                          genres: movie.genres,
                        ),
                      ),
                    ],
                  ),
                )
              : ContentNotFound(message: context.loc().movie_not_found);
        },
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
