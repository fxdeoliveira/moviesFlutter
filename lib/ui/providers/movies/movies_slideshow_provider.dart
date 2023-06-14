import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/ui/providers/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {

    final nowPlayingMovies = ref.watch(nowPlayngMoviesProvider);

    if(nowPlayingMovies.isEmpty){
      return [];
    }
    return nowPlayingMovies.sublist(0,6);
});