import 'package:flutter/material.dart';
import 'package:movies_app/pages/trending/components/trending_content.dart';
import 'package:movies_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<AppProvider>().getTrending(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TrendingContent(data: snapshot.data);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}