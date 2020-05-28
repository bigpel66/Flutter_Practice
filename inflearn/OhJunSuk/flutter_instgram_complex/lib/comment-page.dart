import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentPage extends StatelessWidget {
  final DocumentSnapshot document;

  CommentPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('댓글'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('post')
              .document(document.documentID)
              .collection('comment')
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
                var documents = snapshot.data.documents;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(documents[index]['writer']),
                      title: Text(
                        documents[index]['comment'],
                      ),
                    );
                  },
                );
              } else {
                return Text('Error Occured');
              }
            }
          }),
    );
  }
}
