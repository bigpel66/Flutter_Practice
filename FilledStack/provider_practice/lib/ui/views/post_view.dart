import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/ui/views/views.dart';
import 'package:provider_practice/ui/shared/shared.dart';
import 'package:provider_practice/ui/widgets/widgets.dart';

class PostView extends StatelessWidget {
  final Post post;

  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            LikeButton(postId: post.id),
            CommentsView(postId: post.id),
          ],
        ),
      ),
    );
  }
}
