import 'package:flutter/material.dart';
import 'package:movies_app/models/person.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  const PersonCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "${movieProvider.imageRetrievalUrl}${person.picturePath}",
              height: 300,
              width: 200,
            ),
          ),
        ),
        Text(
          person.name,
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
