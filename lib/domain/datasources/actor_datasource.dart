import '../entities/actor_details.dart';

abstract class ActorsDatasource{

  Future<List<Actor>> getActor(String moviId);
}