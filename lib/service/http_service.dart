import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import '../models/movie.dart';

class HttpService {
  final String apiKey = '9ab01feaef79e38777633940c2d1f816';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final movieMap = jsonResponse['results'];
      print(jsonResponse);
      List movies = movieMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Failed");
      return null;
    }
  }
}
