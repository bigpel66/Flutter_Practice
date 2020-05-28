import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailPostPage extends StatelessWidget {
  final DocumentSnapshot document;
  final FirebaseUser currentUser;

  DetailPostPage({
    @required this.document,
    @required this.currentUser,
  });

  // 팔로우
  Future<void> _follow(DocumentSnapshot document) async {
    await Firestore.instance
        .collection('followings')
        .document(currentUser.email)
        .setData({document['email']: true});

    await Firestore.instance
        .collection('follwers')
        .document(document['email'])
        .setData({currentUser.email: true});
  }

  // 언팔로우
  Future<void> _unfollow() async {
    await Firestore.instance
        .collection('followings')
        .document(currentUser.email)
        .setData({document['email']: false});

    await Firestore.instance
        .collection('follwers')
        .document(document['email'])
        .setData({currentUser.email: false});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(document['photoUrl']),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            document['email'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          if (currentUser.email != document['email'])
                            StreamBuilder<DocumentSnapshot>(
                                stream: Firestore.instance
                                    .collection('followings')
                                    .document(currentUser.email)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                      width: 30.0,
                                      height: 15.0,
                                      color: Colors.grey,
                                    );
                                  } else {
                                    if (snapshot.hasData) {
                                      var data = snapshot.data.data;
                                      bool isFollow;

                                      if (data == null ||
                                          data[document['email']] == null ||
                                          data[document['email']] == false) {
                                        isFollow = false;
                                      } else {
                                        isFollow = true;
                                      }

                                      return GestureDetector(
                                        onTap: () {
                                          isFollow
                                              ? _unfollow()
                                              : _follow(document);
                                        },
                                        child: Text(
                                          isFollow ? "UnFollow" : "Follow",
                                          style: TextStyle(
                                            color: isFollow
                                                ? Colors.red
                                                : Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Text('Error Occured');
                                    }
                                  }
                                }),
                        ],
                      ),
                      Text(document['displayName']),
                    ],
                  ),
                )
              ],
            ),
          ),
          Hero(
            tag: document.documentID,
            child: Image.network(
              document['imageUrl'],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(document['content']),
          ),
        ],
      ),
    );
  }
}
