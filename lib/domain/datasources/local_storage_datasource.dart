

import '../entities/movie.dart';

abstract class LocalStorageDataSource{

  Future<void> toggleFavourite(Movie movie);
  Future<bool> isMovieFavourite(int movieId);
  Future<List<Movie>> loadMovie({int limit = 10, offset = 0});

}