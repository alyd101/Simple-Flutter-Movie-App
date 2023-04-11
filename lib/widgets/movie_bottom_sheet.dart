import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:movies_app/widgets/movie_rating_indicatior.dart';
import 'package:provider/provider.dart';

class MovieBottomSheet extends StatelessWidget {
  final Movie movie;
  const MovieBottomSheet({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<AppProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            movie.title,
            style: const TextStyle(fontSize: 25),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                    "${movieProvider.imageRetrievalUrl}${movie.posterPath}"),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            MovieRatingIndication(voteAverage: movie.voteAverage),
            InkWell(
              onTap: () => movieProvider.togglefavorited(movie),
              child: Icon(
                Icons.favorite,
                color: movie.isFavorited ? Colors.red : Colors.grey,
              ),
            )
          ]),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          RichText(
            text: TextSpan(
                text: "Overview: ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 159, 159, 159),
                ),
                children: [
                  TextSpan(
                    text: movie.overview,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
