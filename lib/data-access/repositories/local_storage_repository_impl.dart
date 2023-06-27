import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource dataSource;

  LocalStorageRepositoryImpl(this.dataSource);

  @override
  Future<bool> isMovieFavourite(int movieId) {
    return dataSource.isMovieFavourite(movieId);
  }

  @override
  Future<List<Movie>> loadMovie({int limit = 10, offset = 0}) {
    return dataSource.loadMovie(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavourite(Movie movie) {
    return dataSource.toggleFavourite(movie);
  }
}
