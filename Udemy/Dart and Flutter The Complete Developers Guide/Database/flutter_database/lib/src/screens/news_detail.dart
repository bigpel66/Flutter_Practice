import 'package:flutter/material.dart';
import 'package:flutter_database/src/widgets/loading_container.dart';
import '../blocs/comments_provider.dart';
import '../models/item_model.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail({this.itemId});

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.commentsOutput,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final itemFuture = snapshot.data[itemId];

        print(itemFuture);

        return FutureBuilder(
          future: itemFuture,
          builder: (context, itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            }

            return Text(itemSnapshot.data.title);
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
