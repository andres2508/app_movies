import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/framework/viewModel/paginator.view.model.consumer.dart';
import 'package:app_movies/ui/all/all_content.view.model.dart';
import 'package:app_movies/ui/common/no_content_available.widget.dart';
import 'package:app_movies/ui/search/search_tile.widget.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:app_movies/utils/theme.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AllContentType {
  POPULAR,
  TOP_RATED;
}

class AllContentListView extends ConsumerStatefulWidget {
  final TMDBContentType type;
  final AllContentType filter;

  const AllContentListView(
      {required this.type, required this.filter, super.key});

  @override
  ConsumerState createState() => _AllContentListViewState();
}

class _AllContentListViewState extends ConsumerState<AllContentListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize scroll listener
      _scrollController.addListener(() => _loadMore());
      // Define load provider according to params
      if (widget.type == TMDBContentType.MOVIE) {
        if (widget.filter == AllContentType.POPULAR) {
          ref.read(allContentViewModelProvider.notifier).loadPopularMovies();
        } else {
          ref.read(allContentViewModelProvider.notifier).loadTopRatedMovies();
        }
      } else {
        if (widget.filter == AllContentType.POPULAR) {
          ref.read(allContentViewModelProvider.notifier).loadPopularSeries();
        } else {
          ref.read(allContentViewModelProvider.notifier).loadTopRatedSeries();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(allContentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type == TMDBContentType.MOVIE
              ? context.loc().movies
              : context.loc().series,
          style: context.textTheme().titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ViewModelPaginatorConsumer<AllContentViewModel>(
          provider: model,
          builder: (_, __) => SingleChildScrollView(
            key: const PageStorageKey<String>('listView'),
            controller: _scrollController,
            child: model.hasItems
                ? Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    children: model.content
                        .map((it) => SearchTile(entity: it))
                        .toList(growable: false),
                  )
                : Center(child: NoContentAvailable()),
          ),
        ),
      ),
    );
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(allContentViewModelProvider.notifier).nextPage();
    }
  }
}
