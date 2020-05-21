import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail-page';

  Widget _buildAppBar() {
    return AppBar();
  }

  Widget _buildBody(document) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(document['userPhotoUrl']),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          document['email'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(document['displayName']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Hero(
              tag: document['imageUrl'],
              child: Image.network(document['imageUrl'], fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(document['content']),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final document = routeArgs['document'];

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(document),
    );
  }
}
