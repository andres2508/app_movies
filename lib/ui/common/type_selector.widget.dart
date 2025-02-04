import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:app_movies/utils/theme.utils.dart';
import 'package:flutter/material.dart';

class SearchTypeSelector extends StatelessWidget {
  final TMDBContentType current;
  final Function(TMDBContentType changed) onChanged;

  const SearchTypeSelector(
      {required this.current, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc();
    final style =
        context.textTheme().bodySmall!.copyWith(color: ColorStyles.dark400);
    return SegmentedButton(
      style: SegmentedButton.styleFrom(
        backgroundColor: ColorStyles.secondary500,
        selectedBackgroundColor: ColorStyles.principal500,
      ),
      segments: [
        ButtonSegment(
          value: TMDBContentType.MOVIE,
          label: Text(loc.movies, style: style),
          icon: Icon(Icons.movie),
        ),
        ButtonSegment(
          value: TMDBContentType.TV_SERIE,
          label: Text(
            loc.series,
            style: style,
          ),
          icon: Icon(Icons.tv),
        ),
      ],
      selected: {current},
      onSelectionChanged: (value) => onChanged.call(value.first),
    );
    ;
  }
}
