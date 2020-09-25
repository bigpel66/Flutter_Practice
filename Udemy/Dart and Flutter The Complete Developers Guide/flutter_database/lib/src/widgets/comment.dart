import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depthOfComment;

  Comment({this.itemId, this.itemMap, this.depthOfComment});

  Widget buildText(ItemModel itemModel) {
    final text = itemModel.text
        .replaceAll('&#x27;', "'")
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '');

    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final item = snapshot.data;

        final children = <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(
              left: depthOfComment * 16.0,
              right: 16.0,
            ),
            title: buildText(item),
            subtitle: item.by == '' ? Text('Deleted') : Text(item.by),
          ),
          Divider(),
        ];

        snapshot.data.kids.forEach((index) {
          children.add(
            Comment(
              itemId: index,
              itemMap: itemMap,
              depthOfComment: depthOfComment + 1,
            ),
          );
        });

        return Column(
          children: children,
        );
      },
    );
  }
}
