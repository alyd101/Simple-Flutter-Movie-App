import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/pages/favorites/components/favorite_card.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<AppProvider>(context);
    List<Movie> favorites = movieProvider.favorites;

    return Visibility(
      visible: movieProvider.favorites.isNotEmpty,
      replacement: const Center(
        child: Text("You have no favorites"),
      ),
      child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) =>
              FavoriteCard(movie: favorites[index])),
    );
  }
}
