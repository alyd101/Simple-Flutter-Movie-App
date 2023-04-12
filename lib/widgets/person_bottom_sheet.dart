import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class PersonBottomSheet extends StatelessWidget {
  final Person person;
  const PersonBottomSheet({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<AppProvider>(context);

    return Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          const SizedBox(
            width: 80,
            child: Divider(
              thickness: 2,
            ),
          ),
          Text(
            person.name,
            style: const TextStyle(fontSize: 25),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    "${movieProvider.imageRetrievalUrl}${person.picturePath}"),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
                text: "Known for: ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 159, 159, 159),
                ),
                children: [
                  TextSpan(
                    text: person.knownForDepartment,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black),
                  )
                ]),
          ),
        ]));
  }
}
