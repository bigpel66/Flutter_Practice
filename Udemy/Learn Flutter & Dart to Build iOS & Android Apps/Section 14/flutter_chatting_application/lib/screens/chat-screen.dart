import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('/chats/s7W9OtiZnSGMD4qNIrGJ/messages')
              .orderBy('datetime', descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              );
            } else {
              if (snapshot.hasData) {
                final documents = snapshot.data.documents;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(documents[index]['text']),
                    );
                  },
                );
              } else {
                return Text('Error Occured');
              }
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Firestore.instance
              .collection('/chats/s7W9OtiZnSGMD4qNIrGJ/messages')
              .add({
            'text': 'hi this is Jason',
            'datetime': DateTime.now().toString(),
          });
          await FirebaseAuth.instance.signOut();
        },
      ),
    );
  }
}
