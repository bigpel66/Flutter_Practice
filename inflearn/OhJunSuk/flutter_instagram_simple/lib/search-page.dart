import 'package:flutter/material.dart';
import './create-page.dart';

class SearchPage extends StatelessWidget {
  Widget _buildGridViewItem(BuildContext context, int index) {
    return Image.network(
        'https://engineering.linecorp.com/wp-content/uploads/2019/08/flutter1.png',
        fit: BoxFit.cover);
  }

  Widget _buildBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      ),
      itemBuilder: (context, index) {
        return _buildGridViewItem(context, index);
      },
      itemCount: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreatePage.routeName);
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.create),
      ),
    );
  }
}
