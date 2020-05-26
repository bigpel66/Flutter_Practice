import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './message-bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        } else {
          if (futureSnapshot.hasData) {
            return StreamBuilder(
              stream: Firestore.instance
                  .collection('chat')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  );
                } else {
                  if (streamSnapshot.hasData) {
                    final documents = streamSnapshot.data.documents;

                    return ListView.builder(
                      reverse: true,
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        return MessageBubble(
                          key: ValueKey(documents[index].documentID),
                          username: documents[index]['username'],
                          message: documents[index]['text'],
                          isMe: documents[index]['userId'] ==
                              futureSnapshot.data.uid,
                        );
                      },
                    );
                  } else {
                    return Text('Error Occured');
                  }
                }
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
