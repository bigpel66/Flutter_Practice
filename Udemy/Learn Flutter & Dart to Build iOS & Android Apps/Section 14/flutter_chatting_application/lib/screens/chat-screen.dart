import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/chat/messages.dart';
import '../widgets/chat/new-message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
        actions: <Widget>[
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                value: 'Signout',
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      const SizedBox(width: 8.0),
                      Text('Signout'),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (value) async {
              if (value == 'Signout') {
                try {
                  await FirebaseAuth.instance.signOut();
                  return null;
                } catch (err) {
                  print(err);
                  return Text('Error Occured');
                }
              } else {
                return null;
              }
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Messages(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: NewMessage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
