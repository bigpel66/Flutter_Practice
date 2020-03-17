import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: StreamBuilder(
        stream: bloc.itemsOutput,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return Text('Stream still loading');
          }

          return FutureBuilder(
            future: snapshot.data[itemId],
            builder: (ctx, itemSnapshot) {
              if (!itemSnapshot.hasData) {
                return Text('Item still loading $itemId');
              }

              return Text(itemSnapshot.data.title);
            },
          );
        },
      ),
    );
  }
}
