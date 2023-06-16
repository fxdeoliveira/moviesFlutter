

import 'package:cinemapedia/data-access/repositories/actor_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data-access/services/actorbb_api_service.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImplementation(ActorApiService());
});