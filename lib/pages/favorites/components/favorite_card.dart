import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FavoriteCard extends StatelessWidget {
  final Movie movie;

  const FavoriteCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<AppProvider>(context);

    return InkWell(
      onTap: () => showBottomSheet(
          context: context,
          builder: (context) => movieProvider.showMovieBottomSheet(movie)),
      child: SizedBox(
        height: 125,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "${movieProvider.imageRetrievalUrl}${movie.posterPath}",
                    fit: BoxFit.contain,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      MovieRatingIndication(voteAverage: movie.voteAverage)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
