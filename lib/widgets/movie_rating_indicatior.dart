import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRatingIndication extends StatelessWidget {
  final double voteAverage;
  const MovieRatingIndication({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Rating: "),
        RatingBarIndicator(
          rating: (voteAverage) / 2,
          itemSize: 15,
          itemCount: 5,
          itemBuilder: (context, index) =>
              const Icon(Icons.star, color: Colors.amber),
        ),
      ],
    );
  }
}
