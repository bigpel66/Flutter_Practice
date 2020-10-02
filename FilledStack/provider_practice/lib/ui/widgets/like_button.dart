import 'package:flutter/material.dart';
import 'package:provider_practice/ui/views/views.dart';
import 'package:provider_practice/providers/providers.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  LikeButton({@required this.postId});

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonModel>(
      builder: (BuildContext context, LikeButtonModel model, Widget child) {
        return Row(
          children: <Widget>[
            Text('Likes ${model.postLikes(postId)}'),
            MaterialButton(
              color: Colors.white,
              child: Icon(Icons.thumb_up),
              onPressed: () {
                model.incrementLikes(postId);
              },
            ),
          ],
        );
      },
    );
  }
}
