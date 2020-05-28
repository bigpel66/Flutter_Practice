import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatelessWidget {
  final FirebaseUser currentUser;

  AccountPage({@required this.currentUser});

  Widget _buildProfile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(currentUser.photoUrl),
                    ),
                  ),
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 28.0,
                        height: 28.0,
                        child: FloatingActionButton(
                          onPressed: null,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: FloatingActionButton(
                          backgroundColor: Colors.blue,
                          onPressed: null,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Text(
              currentUser.displayName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
        StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('post')
                .where('email', isEqualTo: currentUser.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                  ),
                );
              } else {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '${snapshot.data.documents.length}\nPosts',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  );
                } else {
                  return Text('Error Occured');
                }
              }
            }),
        StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection('follwers')
                .document(currentUser.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                  ),
                );
              } else {
                int followers = 0;
                if (snapshot.hasData) {
                  var data = snapshot.data.data;

                  if (data != null) {
                    followers =
                        data.values.where((element) => element).toList().length;
                  }
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '$followers\nFollowers',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                );
              }
            }),
        StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection('followings')
                .document(currentUser.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                  ),
                );
              } else {
                int followings = 0;
                if (snapshot.hasData) {
                  var data = snapshot.data.data;

                  if (data != null) {
                    followings =
                        data.values.where((element) => element).toList().length;
                  }
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '$followings\nFollowings',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                );
              }
            }),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          color: Colors.black,
          onPressed: () {
            FirebaseAuth.instance.signOut();
            GoogleSignIn().signOut();
          },
        )
      ],
      backgroundColor: Colors.white,
      title: Text(
        'Instagram Clone',
        style: GoogleFonts.pacifico(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          _buildProfile(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
