import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/actor_details.dart';
import 'actors_repository.dart';

final actorsInfoProvider = 
  StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actors = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieNotifier(getActors: actors.getActor);
});




typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>>{

  final GetActorsCallback getActors;

  ActorsByMovieNotifier({ required this.getActors}): super(({}));

  Future<void> loaActors(String movieId) async {
    if(state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);

    state = {
      ...state,
      movieId: actors,      
         };
  }

}