import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(appProvider.pageTitles[appProvider.currentPageIndex]),
            InkWell(
              onTap: () {},
              child: const Icon(
                LineIcons.search,
                color: Colors.black,
              ),
            )
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: appProvider.pages[appProvider.currentPageIndex],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
