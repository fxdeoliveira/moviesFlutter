

import 'package:cinemapedia/data-access/repositories/movie_repository_implementation.dart';
import 'package:cinemapedia/data-access/services/moviedb_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});