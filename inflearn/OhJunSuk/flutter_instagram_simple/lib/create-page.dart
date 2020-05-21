import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  static const routeName = '/create-page';

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEdidtingController = TextEditingController();

  @override
  void dispose() {
    textEdidtingController.dispose();
    super.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('새 게시물'),
      actions: <Widget>[
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.send),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Text('No Image'),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          controller: textEdidtingController,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
