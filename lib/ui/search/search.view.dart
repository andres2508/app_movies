import 'package:app_movies/framework/viewModel/paginator.view.model.consumer.dart';
import 'package:app_movies/ui/common/type_selector.widget.dart';
import 'package:app_movies/ui/search/search.view.model.dart';
import 'package:app_movies/ui/search/search_tile.widget.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:app_movies/utils/theme.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends ConsumerStatefulWidget {
  final String query;

  const SearchView({required this.query, super.key});

  @override
  ConsumerState createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() => _loadMore());
      ref.read(searchViewModelProvider.notifier)
        ..initialize(widget.query)
        ..searchMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(searchViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${context.loc().results}: ${widget.query}',
          style: context.textTheme().titleMedium,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SearchTypeSelector(
              current: model.currentType,
              onChanged: (value) => model.changeType(value),
            ),
          ),
          Expanded(
            child: ViewModelPaginatorConsumer<SearchViewModel>(
              provider: model,
              builder: (_, __) => SingleChildScrollView(
                key: const PageStorageKey<String>('listView'),
                controller: _scrollController,
                child: Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children: model.content
                      .map((it) => SearchTile(entity: it))
                      .toList(growable: false),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(searchViewModelProvider.notifier).nextPage();
    }
  }
}
