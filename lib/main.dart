import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/body.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:movies_app/theme.dart';
import 'package:movies_app/utils/custom_scroll_behavior.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return ChangeNotifierProvider(
        create: (context) => AppProvider(),
        builder: (context, child) {
          return MaterialApp(
            scrollBehavior: CustomScrollBehaviour(),
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: const Body(),
          );
        });
  }
}
