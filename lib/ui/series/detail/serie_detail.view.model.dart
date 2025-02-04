import 'package:app_movies/domain/series/app/serie.service.dart';
import 'package:app_movies/domain/series/model/serie_detail.model.dart';
import 'package:app_movies/framework/viewModel/base.view.model.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serieDetailViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return SerieDetailViewModel();
});

class SerieDetailViewModel extends BaseViewModel {
  final SerieService _service = serviceLocator<SerieService>();
  TVSerieDetail? _found;

  TVSerieDetail? get serie => _found;

  bool get hasSerie => _found != null;

  Future<void> loadRequired(int serieId) async {
    await run(() async {
      _found = await _service.findById(serieId);
    });
    notifyListeners();
  }
}
