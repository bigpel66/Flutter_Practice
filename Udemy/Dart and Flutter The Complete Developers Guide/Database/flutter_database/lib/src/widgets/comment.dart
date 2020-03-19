import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depthOfComment;

  Comment({this.itemId, this.itemMap, this.depthOfComment});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Text('Still Loading Comment');
        }

        final item = snapshot.data;

        final children = <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(
              left: depthOfComment * 16.0,
              right: 16.0,
            ),
            title: Text(item.text),
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
