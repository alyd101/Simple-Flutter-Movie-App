import 'package:flutter/material.dart';

class GenreListTile extends StatelessWidget {
  final String genre;
  const GenreListTile({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(genre,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
