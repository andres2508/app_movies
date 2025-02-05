import 'package:app_movies/domain/movie/model/movie.model.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:app_movies/ui/common/no_content_available.widget.dart';
import 'package:app_movies/ui/common/tmdb_tile.widget.dart';
import 'package:app_movies/ui/home/home.view.dart';
import 'package:app_movies/ui/home/home.view.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HomeViewModel>()])
void main() {
  group('Home Test Widgets', () {
    setupServiceLocator();
    testWidgets('Validate if home has not content', (tester) async {
      // Home view provider simulate behaviour
      final mockProvider = MockHomeViewModel();
      when(mockProvider.loadMovieRequired()).thenAnswer((_) => Future.value());
      when(mockProvider.loadSeriesRequired()).thenAnswer((_) => Future.value());
      // Create pump widget
      await tester.pumpWidget(
        Localizations(
          locale: Locale('es'),
          delegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          child: ProviderScope(
            overrides: [
              homeViewModelProvider.overrideWith((_) => mockProvider)
            ],
            child: HomeView(),
          ),
        ),
      );
      // Validate and test
      expect(find.byType(NoContentAvailable), findsNWidgets(2));
    });

    testWidgets('Validate if home has only popular movies', (tester) async {
      // Simulate behaviour
      final mockProvider = MockHomeViewModel();
      final movieMock = Movie(
          'test', 'test', DateTime.now(), 1, 'test', 1, 1, 1, '/test', '/test');
      when(mockProvider.loadMovieRequired()).thenAnswer((_) => Future.value());
      when(mockProvider.popular).thenReturn([movieMock]);
      when(mockProvider.loadSeriesRequired()).thenAnswer((_) => Future.value());
      // Create pump widget
      await tester.pumpWidget(
        Localizations(
          locale: Locale('es'),
          delegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          child: ProviderScope(
            overrides: [
              homeViewModelProvider.overrideWith((_) => mockProvider)
            ],
            child: HomeView(),
          ),
        ),
      );
      // Validate and test
      expect(find.byType(TMDBTile), findsOneWidget);
      expect(find.byType(NoContentAvailable), findsOneWidget);
    });
  });
}
