import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;

  Comment({this.itemId, this.itemMap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Text('Still Loading Comment');
        }

        final children = <Widget>[
          Text(snapshot.data.text),
        ];

        snapshot.data.kids.forEach((index) {
          children.add(
            Comment(itemId: index, itemMap: itemMap),
          );
        });

        return Column(
          children: children,
        );
      },
    );
  }
}
