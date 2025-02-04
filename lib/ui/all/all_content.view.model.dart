import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/domain/movie/app/movie.service.dart';
import 'package:app_movies/domain/series/app/serie.service.dart';
import 'package:app_movies/framework/viewModel/base.view.model.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:app_movies/infrastructure/paginator/paginator.builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allContentViewModelProvider = ChangeNotifierProvider((ref) {
  return AllContentViewModel();
});

class AllContentViewModel extends BaseViewModel {
  final MovieService _movieService = serviceLocator<MovieService>();
  final SerieService _serieService = serviceLocator<SerieService>();

  final List<TMDBEntity> _found = [];
  PaginatorManager<TMDBEntity>? _actualPage;

  bool get hasItems => _found.isNotEmpty;

  List<TMDBEntity> get content => _found;

  Future<void> loadPopularMovies() async {
    await run(() async {
      _actualPage = await _movieService.findPopularAsPaginator();
      _found.clear();
      _found.addAll(_actualPage!.items);
    });
    notifyListeners();
  }

  Future<void> loadTopRatedMovies() async {
    await run(() async {
      _actualPage = await _movieService.findTopRatedAsPaginator();
      _found.clear();
      _found.addAll(_actualPage!.items);
    });
    notifyListeners();
  }

  Future<void> loadPopularSeries() async {
    await run(() async {
      _actualPage = await _serieService.findPopularAsPaginator();
      _found.clear();
      _found.addAll(_actualPage!.items);
    });
    notifyListeners();
  }

  Future<void> loadTopRatedSeries() async {
    await run(() async {
      _actualPage = await _serieService.findTopRatedAsPaginator();
      _found.clear();
      _found.addAll(_actualPage!.items);
    });
    notifyListeners();
  }

  Future<void> nextPage() async {
    await runWithHandlingError(() async {
      if (_actualPage != null && _actualPage!.hasNextPage()) {
        _actualPage = await _actualPage!.nextPage();
        _found.addAll(_actualPage!.items);
      }
    });
    notifyListeners();
  }
}
