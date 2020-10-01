import 'package:flutter/material.dart';
import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/ui/views/views.dart';
import 'package:provider_practice/ui/widgets/widgets.dart';
import 'package:provider_practice/providers/providers.dart';

class CommentsView extends StatelessWidget {
  final int postId;

  CommentsView({this.postId});

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
      builder: (BuildContext context, CommentsModel model, Widget child) {
        return model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.builder(
                  itemCount: model.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CommentItem(comment: model.comments[index]);
                  },
                ),
              );
      },
      onModelReady: (CommentsModel model) {
        model.fetchComents(postId);
      },
    );
  }
}
