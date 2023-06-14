import '../entities/movie.dart';

abstract class MovieDataSource {
  
 Future<List<Movie>> getNowPlaing({int page =1});
 Future<List<Movie>> getPopular({int page =1});
  Future<List<Movie>> getUpcoming({int page =1});
 Future<List<Movie>> getTopRated({int page =1});
}