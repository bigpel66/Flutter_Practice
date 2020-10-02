import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/providers/providers.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  LikeButton({@required this.postId});

  @override
  Widget build(BuildContext context) {
    PostsModel model = Provider.of<PostsModel>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
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
      ),
    );
  }
}
