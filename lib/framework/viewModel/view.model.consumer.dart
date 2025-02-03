import 'package:app_movies/framework/dialog/dialogs.service.dart';
import 'package:app_movies/framework/viewModel/base.view.model.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModelConsumer<T extends BaseViewModel> extends ConsumerWidget {
  final T provider;
  final Color? progressColor;
  final bool showProgress;
  final Widget Function(BuildContext context, WidgetRef ref)? progressIndicator;
  final Widget Function(BuildContext context, WidgetRef ref) builder;

  const ViewModelConsumer({
    required this.provider,
    required this.builder,
    this.progressColor,
    this.progressIndicator,
    this.showProgress = true,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    serviceLocator<DialogsService>().changeContext(context);
    switch (provider.state) {
      case NotifierState.loading:
        return showProgress
            ? progressIndicator?.call(context, ref) ?? _standardProgress()
            : builder(context, ref);
      default:
        return builder(context, ref);
    }
  }

  Widget _standardProgress() {
    return Center(
      child: CircularProgressIndicator(
        color: progressColor,
      ),
    );
  }
}
