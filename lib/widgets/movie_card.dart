import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final movieProvider = Provider.of<AppProvider>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          showBottomSheet(
              backgroundColor: Color.fromARGB(255, 242, 242, 242),
              enableDrag: true,
              constraints: BoxConstraints(
                  maxHeight: screenSize.height * 0.8,
                  minWidth: screenSize.width),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              context: context,
              builder: (context) => movieProvider.showMovieBottomSheet(movie));
        },
        child: SizedBox(
          child: Image.network(
              "${movieProvider.imageRetrievalUrl}${movie.posterPath}"),
        ),
      ),
    );
  }
}
