import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  Widget buildList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (ctx, index) {
        return FutureBuilder(
          future: getFuture(),
          builder: (ctx, snapshot) {
            return Container(
              height: 80,
              child: snapshot.hasData
                  ? Text('I\'m visible')
                  : Text('I haven\'t fetched data yet'),
            );
          },
        );
      },
    );
  }

  Future<void> getFuture() {
    return Future.delayed(Duration(seconds: 2), () {
      return 'hi';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(),
    );
  }
}
