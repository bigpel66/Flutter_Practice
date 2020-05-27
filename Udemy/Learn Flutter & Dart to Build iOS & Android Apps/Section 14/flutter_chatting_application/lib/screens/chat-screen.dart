import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../widgets/chat/messages.dart';
import '../widgets/chat/new-message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(
      onMessage: (msg) {
        print(msg);
        print(1);
        return;
      },
      onLaunch: (msg) {
        print(msg);
        print(2);
        return;
      },
      onResume: (msg) {
        print(msg);
        print(3);
        return;
      },
    );
    fbm.subscribeToTopic('chat');
    super.initState();
  }

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
