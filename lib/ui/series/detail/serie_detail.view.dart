import 'package:app_movies/framework/viewModel/view.model.consumer.dart';
import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/ui/common/info_content.widget.dart';
import 'package:app_movies/ui/common/movie_header.widget.dart';
import 'package:app_movies/ui/common/not_found.widget.dart';
import 'package:app_movies/ui/common/web_image.widget.dart';
import 'package:app_movies/ui/series/detail/serie_detail.view.model.dart';
import 'package:app_movies/utils/fluro.utils.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SerieDetailView extends ConsumerStatefulWidget {
  final int serieId;

  const SerieDetailView({required this.serieId, super.key});

  @override
  ConsumerState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends ConsumerState<SerieDetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(serieDetailViewModelProvider.notifier)
          .loadRequired(widget.serieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(serieDetailViewModelProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ViewModelConsumer(
        provider: model,
        builder: (_, __) {
          final serie = model.serie;
          return model.hasSerie
              ? SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Stack(
                    children: [
                      WebImage(
                        path: model.serie!.posterUrl(),
                        height: size.height * 0.65,
                        width: size.width,
                      ),
                      _backButton(),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: size.height * 0.45,
                        child: TMDBDetailHeader(
                          releaseDate: serie!.firstAirDate,
                          voteAverage: serie.voteAverage,
                          voteCount: serie.voteCount,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: size.height * 0.64,
                        child: DetailInfoContent(
                          title: serie.name,
                          overview: serie.overview,
                        ),
                      ),
                    ],
                  ),
                )
              : ContentNotFound(message: context.loc().serie_not_found);
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
