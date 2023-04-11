import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MovieService {
  final String _baseUrl = "https://api.themoviedb.org/3";
  final String _apiKey = "eae26be244b6ba02e8ee80cfc64acb5a";

  Future<List<String>> getGenres() async {
    List<String> genres = <String>[];
    final uri =
        Uri.parse("$_baseUrl/genre/movie/list?api_key=$_apiKey&language=en-US");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      for (Map i in jsonDecode(response.body)["genres"]) {
        genres.add(i["name"]);
      }
      return genres;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<Movie>> getTrendingMovies() async {
    List<Movie> trendingMovies = <Movie>[];

    final uri = Uri.parse("$_baseUrl/trending/movie/day?api_key=$_apiKey");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      for (Map i in jsonDecode(response.body)["results"]) {
        trendingMovies.add(Movie.fromJson(i));
      }
      return trendingMovies;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<Person>> getTrendingPeople() async {
    List<Person> trendingPeople = <Person>[];

    final uri = Uri.parse("$_baseUrl/trending/person/day?api_key=$_apiKey");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      for (Map i in jsonDecode(response.body)["results"]) {
        trendingPeople.add(Person.fromJson(i));
      }
      return trendingPeople;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
