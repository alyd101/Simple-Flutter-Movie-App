import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          fontSize: 30, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      selectedItemColor: Color.fromARGB(255, 0, 0, 0),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 10)),
    
);
