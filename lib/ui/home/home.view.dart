import 'package:app_movies/framework/viewModel/view.model.consumer.dart';
import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/ui/common/type_selector.widget.dart';
import 'package:app_movies/ui/home/home.view.model.dart';
import 'package:app_movies/ui/home/movie_banner.widget.dart';
import 'package:app_movies/utils/fluro.utils.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:app_movies/utils/theme.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).loadMovieRequired();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(homeViewModelProvider);
    final loc = context.loc();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.welcome_back,
          style: context.textTheme().bodySmall!.copyWith(
                color: ColorStyles.dark200,
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              'assets/images/tmdb_logo.svg',
              width: 150,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SearchBar(
                leading: Icon(Icons.search),
                hintText: loc.search_movie,
                onSubmitted: (value) => _onSearch(value),
              ),
            ),
            Expanded(
                child: ViewModelConsumer<HomeViewModel>(
              provider: model,
              builder: (_, __) {
                return SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: [
                      SearchTypeSelector(
                        current: model.type,
                        onChanged: (value) => model.changeType(value),
                      ),
                      TMDBBanner(
                        title: model.isMovieType
                            ? loc.popular_movies
                            : loc.popular_series,
                        content: model.popular,
                        onSeeAll: () {},
                      ),
                      TMDBBanner(
                        title: loc.top_rated,
                        content: model.topRated,
                        onSeeAll: () {},
                      )
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }

  _onSearch(String value) {
    context.go('/search/$value');
  }
}
