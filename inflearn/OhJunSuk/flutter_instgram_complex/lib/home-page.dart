import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import './feed-widget.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser currentUser;

  HomePage({@required this.currentUser});

  Widget _buildNoPostBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram에 오신 것을 환영합니다',
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Text('사진과 동영상을 보려면 팔로우하세요.'),
            Padding(padding: EdgeInsets.all(16.0)),
            SizedBox(
              width: 260.0,
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(currentUser.photoUrl),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text(
                        currentUser.email,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(currentUser.displayName),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/09/21/19/12/france-2773030_1280.jpg',
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                          ),
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/06/21/05/42/fog-2426131_1280.jpg',
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                          ),
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network(
                                'https://cdn.pixabay.com/photo/2019/02/04/20/07/flowers-3975556_1280.jpg',
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(4.0)),
                      Text('Facebook 친구'),
                      Padding(padding: EdgeInsets.all(4.0)),
                      RaisedButton(
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        child: Text('팔로우'),
                        onPressed: () {},
                      ),
                      Padding(padding: EdgeInsets.all(4.0))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 게시물이 있을 경우에 표시한 body
  Widget _buildHasPostBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('post')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.grey),
          );
        } else {
          if (snapshot.hasData) {
            var documents = snapshot.data.documents;

            if (documents.length == 0) {
              return _buildNoPostBody();
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return FeedWidget(
                    key: ValueKey(documents[index].documentID),
                    document: documents[index],
                    currentUser: currentUser,
                  );
                },
                itemCount: documents.length,
              );
            }
          } else {
            return Text('Error Occured');
          }
        }
      },
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: _buildHasPostBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Clone',
          style: GoogleFonts.pacifico(),
        ),
      ),
      body: _buildBody(),
    );
  }
}
