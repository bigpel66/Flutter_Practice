import 'package:flutter/material.dart';
import 'package:flutter_netflix_application/widget/box-slider.dart';
import '../widget/carousel-image.dart';
import '../widget/circle-slider.dart';
import '../widget/box-slider.dart';
import '../model/movie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착1',
      'keyword': '사랑',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착2',
      'keyword': '로맨스',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착3',
      'keyword': '판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착1',
      'keyword': '사랑',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착2',
      'keyword': '로맨스',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착3',
      'keyword': '판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(movies: movies),
            TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25.0,
          ),
          Container(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              'TV Programs',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              'Movies',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              'Dibs',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
