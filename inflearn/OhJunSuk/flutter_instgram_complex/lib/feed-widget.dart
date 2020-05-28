import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './comment-page.dart';

class FeedWidget extends StatefulWidget {
  final Key key;
  final DocumentSnapshot document;
  final FirebaseUser currentUser;

  FeedWidget({
    @required this.key,
    @required this.document,
    @required this.currentUser,
  });

  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var comment = widget.document['comment'] ?? 0;
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.document['photoUrl']),
          ),
          title: Text(
            widget.document['email'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.more_vert),
        ),
        Image.network(
          widget.document['imageUrl'],
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.favorite_border),
              SizedBox(
                width: 8.0,
              ),
              Icon(Icons.comment),
              SizedBox(
                width: 8.0,
              ),
              Icon(Icons.send),
            ],
          ),
          trailing: Icon(Icons.bookmark_border),
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 16.0,
            ),
            Text(
              '좋아요 100개',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 16.0,
            ),
            Text(
              widget.document['email'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(widget.document['content']),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CommentPage(widget.document),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '댓글 $comment개 모두 보기',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ],
                ),
                if (widget.document['lastComment'].isNotEmpty)
                  Text(widget.document['lastComment'])
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  controller: _commentController,
                  onSubmitted: (text) {
                    _writeComment(text);
                    _commentController.text = '';
                  },
                  decoration: InputDecoration(
                    hintText: '댓글 달기',
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  // 좋아요
  void _like() {}

  // 좋아요 취소
  void _unlike() {}

  // 댓글 작성
  void _writeComment(String text) {}
}
