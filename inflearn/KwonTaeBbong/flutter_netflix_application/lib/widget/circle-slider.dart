import 'package:flutter/material.dart';
import '../screen/detail-screen.dart';
import '../model/movie.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;

  CircleSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Preview'),
          Container(
            height: 120.0,
            child: Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: makeCircleImages(context, movies),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie> list) {
  List<Widget> results = [];

  for (int i = 0; i < list.length; i++) {
    results.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Material(
          child: InkWell(
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
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/${list[i].poster}'),
                  radius: 48,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  return results;
}
