import 'package:app_movies/domain/genre/model/genre.model.dart';
import 'package:app_movies/ui/common/chip.widget.dart';
import 'package:app_movies/utils/locale.utils.dart';
import 'package:app_movies/utils/theme.utils.dart';
import 'package:flutter/material.dart';

class DetailInfoContent extends StatelessWidget {
  final String title;
  final String overview;
  final List<Genre>? genres;

  const DetailInfoContent(
      {required this.title, required this.overview, this.genres, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: size.height * 0.35,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme().titleMedium,
              ),
              genres != null
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                        children: genres!
                            .map((it) => LabelChip(label: it.name))
                      .toList(growable: false),
                ),
                    )
                  : SizedBox.shrink(),
              Text(
                overview.isNotEmpty ? overview : context.loc().without_overview,
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
