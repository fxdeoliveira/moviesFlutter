import '../entities/movie.dart';

abstract class MovieDataSource {
  
 Future<List<Movie>> getNowPlaing({int page =1});
}