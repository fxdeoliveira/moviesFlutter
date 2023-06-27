import 'package:cinemapedia/ui/providers/index.dart';
import 'package:cinemapedia/ui/views/movies/movies_favorites_masorny.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {

  bool isLastPage = false;
  bool isLoadin = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if(isLoadin || isLastPage)return;
    isLoadin = true;

    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoadin = false;

    if( movies.isEmpty){
      isLastPage = true;
    }

  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if(favoriteMovies.isEmpty){
      final colors = Theme.of(context).colorScheme;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.favorite_outline_rounded, size: 60, color: colors.primary),
              Text('Ohhh no!!', style: TextStyle(fontSize: 30, color: colors.primary)),
              const Text('No tienes peliculas en favoritos', style: TextStyle(fontSize: 20, color: Colors.black45)),
            ],
          ),
        );
    }

    return Scaffold(
      body: MovieMasonry(
        loadnextpage: loadNextPage,
        movies: favoriteMovies
        )
        );
  }
}
