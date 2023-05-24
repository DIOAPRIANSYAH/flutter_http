// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  late int id;
  late String title;
  late double voteAverage;
  late String overview;
  late String posterPath;
  late String releaseDate;
  late double popularity;
  late String original_language;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath,
      this.releaseDate, this.popularity, this.original_language);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    voteAverage = parsedJson['vote_average'] * 1.0;
    overview = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
    releaseDate = parsedJson['release_date'];
    popularity = parsedJson['popularity'];
    original_language = parsedJson['original_language'];
  }
}
