import 'package:flutter/material.dart';
import '../screen/detail-screen.dart';
import '../model/movie.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;

  BoxSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Focused Contents'),
          Container(
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, movies),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(BuildContext context, List<Movie> list) {
  List<Widget> results = [];

  for (int i = 0; i < list.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
                return DetailScreen(movie: list[i]);
              },
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Align(
            alignment: Alignment.center,
            child: Image.network('${list[i].poster}'),
          ),
        ),
      ),
    );
  }

  return results;
}
