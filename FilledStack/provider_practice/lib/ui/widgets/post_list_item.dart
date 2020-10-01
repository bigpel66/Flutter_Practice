import 'package:flutter/material.dart';
import 'package:provider_practice/models/models.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final Function onTap;

  const PostListItem({this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              offset: Offset(0.0, 2.0),
              color: Color.fromARGB(80, 0, 0, 0),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              post.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
