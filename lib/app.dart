import 'package:app_movies/framework/router/router.builder.dart';
import 'package:app_movies/infrastructure/localization/localization.provider.dart';
import 'package:app_movies/infrastructure/localization/localization.service.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:app_movies/styles/theme.style.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieMobileApp extends ConsumerStatefulWidget {
  const MovieMobileApp({super.key});

  @override
  ConsumerState createState() => _MovieMobileAppState();
}

class _MovieMobileAppState extends ConsumerState<MovieMobileApp> {
  final FluroRouter router = MovieRouterBuilder.initialize().build();

  @override
  Widget build(BuildContext context) {
    final localeProvider = ref.watch(movieLocalizationViewModelProvider);
    // Update locale observer
    serviceLocator<LocalizationObserver>().changeTo(localeProvider.locale);
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      theme: MovieMaterialTheme.dark,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: router.generator,
      initialRoute: '/',
      locale: localeProvider.locale,
    );
  }
}
