import 'package:cinemapedia/ui/views/index.dart';
import 'package:flutter/material.dart';

import '../../widgets/index.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-page';
  final int pageIndex;

  const HomeScreen({
    required this.pageIndex,
    Key? key,
  }) : super(key: key);

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: pageIndex),
    );
  }
}
