import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final TextEditingController _textEditingController = TextEditingController();

  var _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    final currentUser = await FirebaseAuth.instance.currentUser();

    try {
      Firestore.instance.collection('chat').add({
        'text': _enteredMessage,
        'createdAt': Timestamp.now(),
        'userId': currentUser.uid,
      });
      
      _textEditingController.clear();
      _enteredMessage = '';
    } catch (err) {
      print(err.message);
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Send a Message ...',
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
              onSubmitted: (value) {
                if (_enteredMessage.trim().isNotEmpty) {
                  _sendMessage();
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          ),
        ],
      ),
    );
  }
}
