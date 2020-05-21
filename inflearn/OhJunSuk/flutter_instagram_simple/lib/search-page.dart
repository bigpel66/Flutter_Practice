import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './loading-page.dart';
import './create-page.dart';
import './detail-page.dart';

class SearchPage extends StatelessWidget {
  final FirebaseUser userInfo;

  SearchPage({this.userInfo});

  Widget _buildGridViewItem(BuildContext context, item) {
    return Hero(
      tag: item['imageUrl'],
      child: Material(
        child: InkWell(
          child: Image.network(item['imageUrl'], fit: BoxFit.cover),
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailPage.routeName,
              arguments: {'document': item},
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
        stream: Firestore.instance.collection('post').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            if (snapshot.hasData) {
              var items = snapshot.data.documents ?? [];

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                ),
                itemBuilder: (context, index) {
                  return _buildGridViewItem(context, items[index]);
                },
                itemCount: items.length,
              );
            } else {
              return Center(child: Text('No Data'));
            }
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            CreatePage.routeName,
            arguments: {'userInfo': userInfo},
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.create),
      ),
    );
  }
}
