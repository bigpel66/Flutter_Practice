import 'package:flutter/material.dart';
import 'package:flutter_database/src/widgets/loading_container.dart';
import '../blocs/comments_provider.dart';
import '../models/item_model.dart';
import '../widgets/comment.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail({this.itemId});

  Widget buildTitle(ItemModel itemModel) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(10.0),
      child: Text(
        itemModel.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildList(ItemModel itemModel, Map<int, Future<ItemModel>> itemMap) {
    final children = <Widget>[];
    final commentsList = itemModel.kids.map((index) {
      return Comment(
        itemId: index,
        itemMap: itemMap,
        depthOfComment: 1,
      );
    }).toList();

    children.add(buildTitle(itemModel));
    children.addAll(commentsList);

    return ListView(
      children: children,
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.commentsOutput,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final itemFuture = snapshot.data[itemId];

        return FutureBuilder(
          future: itemFuture,
          builder: (context, itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            }

            return buildList(itemSnapshot.data, snapshot.data);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = CommentsProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: buildBody(bloc),
    );
  }
}
