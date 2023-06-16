import 'package:cinemapedia/data-access/mappers/actor_mapper.dart';
import 'package:cinemapedia/domain/datasources/actor_datasource.dart';
import 'package:cinemapedia/domain/entities/actor_details.dart';
import 'package:dio/dio.dart';

import '../../config/constants/environment.dart';
import '../models/moviedb/actors/credits_response.dart';

class ActorApiService extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActor(String moviId) async {
    final response = await dio.get('/movie/$moviId/credits');

    final castResponse = ActorsDetails.fromJson(response.data);
    List<Actor> actors =
        castResponse.cast.map((e) => Actormapper.casttoEntity(e)).toList();

    return actors;
  }
}
