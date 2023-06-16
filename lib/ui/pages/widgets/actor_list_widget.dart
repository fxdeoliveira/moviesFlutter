import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/ui/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActorsListView extends ConsumerWidget {

  final String movieId;

  const ActorsListView({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, ref) {

    final actorsByMovie = ref.watch(actorsInfoProvider);

    if(actorsByMovie[movieId] == null) return const CircularProgressIndicator(strokeWidth: 2,);


    final actors = actorsByMovie[movieId]!;

    return SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          itemBuilder: (context, index) {
              final actor = actors[index];
            return Container(padding: const EdgeInsets.all(8.0),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              FadeInRight(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    actor.profilePath,
                    height: 180,
                    width: 135,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Text(actor.name, maxLines: 2,),
              Text(actor.character ?? '', maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
              ),)
            ]),
            );
        },
        ),
    );

  }
}