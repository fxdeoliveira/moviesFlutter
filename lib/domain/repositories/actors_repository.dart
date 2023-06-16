import '../entities/actor_details.dart';

abstract class ActorsRepository{

  Future<List<Actor>> getActor(String moviId);
}