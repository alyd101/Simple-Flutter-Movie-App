import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class TrendingContent extends StatelessWidget {
  final Map<String, List>? data;
  const TrendingContent({super.key, required this.data});
 
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List? movies = data!["movies"];
    List? people = data!["people"];

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: screenSize.height + 230),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Movies",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: movies!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: MovieCard(movie: movies[index]),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            const Text(
              "People",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: people!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: PersonCard(person: people[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
