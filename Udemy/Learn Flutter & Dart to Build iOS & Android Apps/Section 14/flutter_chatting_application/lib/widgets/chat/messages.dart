import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('chat')
          .orderBy('dateTime', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        } else {
          if (snapshot.hasData) {
            final documents = snapshot.data.documents;

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                return Text(documents[index]['text']);
              },
            );
          } else {
            return Text('Error Occured');
          }
        }
      },
    );
  }
}
