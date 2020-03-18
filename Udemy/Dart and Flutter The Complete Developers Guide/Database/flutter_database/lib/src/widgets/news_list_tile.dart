import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  Widget buildTile(ItemModel itemModel) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(itemModel.title),
          subtitle: Text(
            '${itemModel.score.toString()} votes',
          ),
          trailing: Column(
            children: <Widget>[
              Icon(Icons.comment),
              Text('${itemModel.descendants}'),
            ],
          ),
        ),
        Divider(thickness: 2.5, height: 8.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
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

            return buildTile(itemSnapshot.data);
          },
        );
      },
    );
  }
}
