import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {

  final int  currentIndex;

  const CustomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  // int getCurrentIndex(BuildContext context) {
  //   final String location = GoRouterState.of(context).location;

  //   switch (location) {
  //     case '/':
  //       return 0;
  //     case '/categories':
  //       return 1;
  //     case '/favorites':
  //       return 2;
  //     default:
  //       return 0;
  //   }
  // }

  void onItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
       currentIndex: currentIndex,
       onTap: (value) => onItemTap(context, value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label_important_outline), label: 'Categorias'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favoritos',
          ),
        ]);
  }
}
