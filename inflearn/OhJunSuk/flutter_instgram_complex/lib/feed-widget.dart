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

  void _like() async {
    final List<String> likedUsers =
        List<String>.from(widget.document['likedUsers'] ?? []);

    likedUsers.add('${widget.currentUser.email}');

    final updatedDocument = {
      'likedUsers': likedUsers,
    };

    await Firestore.instance
        .collection('post')
        .document(widget.document.documentID)
        .updateData(updatedDocument);
  }

  void _unlike() async {
    final List<String> likedUsers =
        List<String>.from(widget.document['likedUsers'] ?? []);

    // likedUsers.removeWhere((element) => element == widget.currentUser.email);
    likedUsers.remove(widget.currentUser.email);

    final updatedDocument = {
      'likedUsers': likedUsers,
    };

    await Firestore.instance
        .collection('post')
        .document(widget.document.documentID)
        .updateData(updatedDocument);
  }

  void _writeComment(String text) async {
    try {
      final data = {
        'writer': widget.currentUser.displayName,
        'comment': text,
        'createdAt': Timestamp.now(),
      };

      await Firestore.instance
          .collection('post')
          .document(widget.document.documentID)
          .collection('comment')
          .add(data);

      await Firestore.instance
          .collection('post')
          .document(widget.document.documentID)
          .updateData(
        {
          'commentCount': (widget.document['commentCount'] ?? 0) + 1,
          'lastComment': text,
        },
      );
    } catch (err) {
      throw err;
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var commentCount = widget.document['commentCount'] ?? 0;

    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.document['photoUrl']),
          ),
          title: Text(
            widget.document['displayName'],
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
              widget.document['likedUsers']
                          ?.contains(widget.currentUser.email) ??
                      false
                  ? GestureDetector(
                      onTap: _unlike,
                      child: Icon(Icons.favorite, color: Colors.red),
                    )
                  : GestureDetector(
                      onTap: _like,
                      child: Icon(Icons.favorite_border),
                    ),
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
              '${widget.document['likedUsers']?.length ?? 0} Likes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
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
              widget.document['displayName'],
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
        if (commentCount > 0)
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
                        'Show $commentCount Comments',
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
                    if (text.isNotEmpty) {
                      _writeComment(text);
                      _commentController.text = '';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Submit a Comment',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (_commentController.text.isNotEmpty) {
                  FocusScope.of(context).unfocus();
                  _writeComment(_commentController.text);
                  _commentController.text = '';
                }
              },
            )
          ],
        ),
        Divider(),
      ],
    );
  }
}
