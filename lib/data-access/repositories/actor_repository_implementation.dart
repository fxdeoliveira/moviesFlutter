import 'package:cinemapedia/domain/datasources/actor_datasource.dart';
import 'package:cinemapedia/domain/entities/actor_details.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImplementation extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorRepositoryImplementation(this.datasource);

  @override
  Future<List<Actor>> getActor(String moviId) {
    return datasource.getActor(moviId);
  }
}
