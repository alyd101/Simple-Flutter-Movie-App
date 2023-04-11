import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppProvider>(context);
    int currentPageIndex = appState.currentPageIndex;

    return BottomNavigationBar(
      currentIndex: currentPageIndex,
      onTap: (value) {
        appState.setCurrentPageIndex(value);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(LineIcons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(LineIcons.compass), label: "Discover"),
        BottomNavigationBarItem(
            icon: Icon(LineIcons.heart), label: "Favorites"),
      ],
    );
  }
}
