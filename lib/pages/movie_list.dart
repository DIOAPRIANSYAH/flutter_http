import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http/service/http_service.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  String result = "";
  int moviesCount = 0;
  late List movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular Movies',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: (moviesCount == 0) ? 0 : moviesCount,
        itemBuilder: (context, int position) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.black,
              elevation: 5,
              child: InkWell(
                //Wrapped Row with InkWell
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
                child: Row(
                  children: <Widget>[
                    SizedBox(
                        height: 180,
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movies[position].posterPath}')),
                    Expanded(
                      child: Ink(
                        color: Color.fromARGB(255, 40, 40, 40),
                        height: 180,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${movies[position].title}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.star_fill,
                                  color: Color.fromARGB(255, 255, 247, 10),
                                  size: 15.0,
                                ),
                                Text(
                                  ' ${movies[position].voteAverage} | ',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 139, 136, 136),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${movies[position].original_language}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 139, 136, 136),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                                child: Text(
                              '${movies[position].overview}',
                              style: const TextStyle(color: Colors.white),
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
