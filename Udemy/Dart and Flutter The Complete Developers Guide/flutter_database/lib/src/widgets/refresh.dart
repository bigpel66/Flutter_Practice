import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return RefreshIndicator(
      onRefresh: () async {
        await bloc.cleaerCache();
        await bloc.fetchTopIds();
      },
      child: child,
    );
  }
}
