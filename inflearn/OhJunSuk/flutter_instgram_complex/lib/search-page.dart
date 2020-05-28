import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import './create-page.dart';
import './loading-page.dart';
import './detail-post-page.dart';

class SearchPage extends StatelessWidget {
  final FirebaseUser currentUser;

  SearchPage({@required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(
        'Instagram Clone',
        style: GoogleFonts.pacifico(),
      ),
    );
  }

  Widget _buildBody(context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('post')
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingPage();
            } else {
              if (snapshot.hasData) {
                var items = snapshot.data.documents;

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                  ),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildListItem(context, items[index]);
                  },
                );
              } else {
                return Text('Error Occured');
              }
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  CreatePage(currentUser: currentUser),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot item) {
    return Hero(
      tag: item.documentID,
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => DetailPostPage(
                  currentUser: currentUser,
                  document: item,
                ),
              ),
            );
          },
          child: Image.network(
            item['imageUrl'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
