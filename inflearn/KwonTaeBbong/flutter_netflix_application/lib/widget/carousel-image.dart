import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../screen/detail-screen.dart';
import '../model/movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  CarouselImage({this.movies});

  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;

  int _currentPage;
  String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((movie) {
      return Image.network('${movie.poster}');
    }).toList();
    keywords = movies.map((movie) {
      return movie.keyword;
    }).toList();
    likes = movies.map((movie) {
      return movie.like;
    }).toList();
    _currentKeyword = keywords[0];
    _currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
          ),
          //TODO: GET 1
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11.0),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[_currentPage]
                          ? IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = !likes[_currentPage];
                                  movies[_currentPage]
                                      .documentReference
                                      .updateData(
                                          {'like': likes[_currentPage]});
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = !likes[_currentPage];
                                  movies[_currentPage]
                                      .documentReference
                                      .updateData(
                                          {'like': likes[_currentPage]});
                                });
                              },
                            ),
                      Text('Dibs', style: TextStyle(fontSize: 11.0))
                    ],
                  ),
                ),
                Container(
                  child: FlatButton(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.play_arrow, color: Colors.black),
                        const Padding(padding: const EdgeInsets.all(3.0)),
                        Text(
                          'Play',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) {
                                return DetailScreen(
                                    movie: movies[_currentPage]);
                              },
                            ),
                          );
                        },
                      ),
                      Text(
                        'Info',
                        style: TextStyle(fontSize: 11.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage),
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: GET 2
List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (int i = 0; i < list.length; i++) {
    results.add(
      Container(
        width: 8.0,
        height: 8.0,
        margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
    );
  }

  return results;
}
