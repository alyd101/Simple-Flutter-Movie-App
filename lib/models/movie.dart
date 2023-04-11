class Movie {
  final String title;
  final String posterPath;
  final String overview;
  final double voteAverage;
  bool isFavorited = false;

  Movie(
      {required this.title,
      required this.posterPath,
      required this.overview,
      required this.voteAverage});

  factory Movie.fromJson(Map data) {
    final title = data["title"];
    final posterPath = data["poster_path"];
    final overview = data['overview'];
    final voteAverage = data["vote_average"];

    return Movie(
        title: title,
        posterPath: posterPath,
        overview: overview,
        voteAverage: voteAverage);
  }

}
