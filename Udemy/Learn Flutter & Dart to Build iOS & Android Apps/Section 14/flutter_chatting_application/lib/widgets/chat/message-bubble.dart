import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String username;
  final String message;
  final bool isMe;

  MessageBubble({
    this.key,
    this.username,
    this.message,
    this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            decoration: BoxDecoration(
              color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomLeft: isMe ? Radius.circular(12.0) : Radius.circular(0.0),
                bottomRight:
                    isMe ? Radius.circular(0.0) : Radius.circular(12.0),
              ),
            ),
            width: 140.0,
            height: 75.0,
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                // NOT GOOD WAY, FETCHING FROM API EVERY MESSAGE
                // FutureBuilder<dynamic>(
                //     future: Firestore.instance
                //         .collection('users')
                //         .document(userId)
                //         .get(),
                //     builder: (context, futureSnapshot) {
                //       if (futureSnapshot.connectionState ==
                //           ConnectionState.waiting) {
                //         return Text('... Loading');
                //       } else {
                //         if (futureSnapshot.hasData) {
                //           return Text(
                //             futureSnapshot.data['username'],
                //             style: TextStyle(fontWeight: FontWeight.bold),
                //           );
                //         } else {
                //           return Text('Name Fetch Error');
                //         }
                //       }
                //     }),
                Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  message,
                  style: TextStyle(
                    color: isMe
                        ? Colors.black
                        : Theme.of(context).accentTextTheme.headline1.color,
                  ),
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
