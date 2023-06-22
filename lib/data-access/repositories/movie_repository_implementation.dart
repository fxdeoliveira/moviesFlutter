import 'package:cinemapedia/domain/entities/movie.dart';

import '../../domain/datasources/movies_datasources.dart';
import '../../domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaing({int page = 1}) {
    return dataSource.getNowPlaing(page: page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }

    @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return dataSource.getUpcoming(page: page);
  }

    @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSource.getTopRated(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id); 
  }
  
  @override
  Future<List<Movie>> SearchMovieByName(String movie) {
    return dataSource.searchMovieByName(movie);
  }
}
