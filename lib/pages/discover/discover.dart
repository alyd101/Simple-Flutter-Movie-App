import 'package:flutter/material.dart';
import 'package:movies_app/pages/discover/components/genre_list_tile.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<AppProvider>(context).fetchGenres(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String>? genres = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: genres!.length,
                    itemBuilder: (context, index) =>
                        GenreListTile(genre: genres[index]),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        });
  }
}
