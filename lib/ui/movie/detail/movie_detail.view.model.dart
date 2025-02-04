import 'package:app_movies/domain/movie/app/movie.service.dart';
import 'package:app_movies/domain/movie/model/movie_detail.model.dart';
import 'package:app_movies/framework/viewModel/base.view.model.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return MovieDetailViewModel();
});

class MovieDetailViewModel extends BaseViewModel {
  final MovieService _service = serviceLocator<MovieService>();
  MovieDetail? _found;

  MovieDetail? get movie => _found;

  bool get hasMovie => _found != null;

  Future<void> loadRequired(int movieId) async {
    await run(() async {
      _found = await _service.findById(movieId);
    });
    notifyListeners();
  }
}
