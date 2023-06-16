import 'package:cinemapedia/data-access/models/moviedb/actors/credits_response.dart';
import 'package:cinemapedia/domain/entities/actor_details.dart';

class Actormapper{

  static Actor casttoEntity(Cast cast) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: (cast.profilePath != null)  
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
     :  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
    character: cast.character
    );
}