import 'package:flutter/cupertino.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/pages/pages.dart';
import 'package:movies_app/services/movie_service.dart';
import 'package:movies_app/widgets/widgets.dart';

class AppProvider extends ChangeNotifier {
  final MovieService movieService = MovieService();
  final String imageRetrievalUrl = "https://image.tmdb.org/t/p/w500";
  List<Movie> favorites = [];
  final Map<String, Widget> pageMap = {
    "Trending": const TrendingPage(),
    "Discover": const DiscoverPage(),
    "Favorites": const FavoritesPage(),
  };
  int currentPageIndex = 0;

  List<String> get pageTitles {
    return pageMap.keys.toList();
  }

  List<Widget> get pages {
    return pageMap.values.toList();
  }

  void setCurrentPageIndex(value) {
    currentPageIndex = value;
    notifyListeners();
  }

  Widget showMovieBottomSheet(Movie movie) {
    return MovieBottomSheet(movie: movie);
  }

  void togglefavorited(Movie movie) {
    movie.isFavorited = !movie.isFavorited;
    if (movie.isFavorited) {
      favorites.add(movie);
    } else {
      favorites.remove(movie);
    }
    notifyListeners();
  }

  Future<List<String>> fetchGenres() async {
    return await movieService.getGenres();
  }

  Future<Map<String, List>> getTrending() async {
    Map<String, List> trending = {};
    trending["movies"] = await movieService.getTrendingMovies();
    trending["people"] = await movieService.getTrendingPeople();
    return trending;
  }
}
