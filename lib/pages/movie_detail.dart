import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'info_card.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  const MovieDetail(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'http://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: 600,
                    height: 600,
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.2, 0.8, 1],
                      ),
                    ),
                    child: Image.network(
                      path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
                child: Text(
                  movie.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 16, top: 3, bottom: 3)),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color.fromARGB(255, 255, 247, 10),
                    size: 15.0,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color.fromARGB(255, 255, 247, 10),
                    size: 15.0,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color.fromARGB(255, 255, 247, 10),
                    size: 15.0,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color.fromARGB(255, 255, 247, 10),
                    size: 15.0,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color.fromARGB(255, 255, 247, 10),
                    size: 15.0,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
                child: Text(
                  movie.releaseDate,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 139, 136, 136),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InfoCard('124 min', Icons.timer),
                  InfoCard('2018', Icons.calendar_today),
                  InfoCard('8.4/10', Icons.star),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Text(
                  movie.overview,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
