import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/movie.dart';
import '../../delegates/search_movie_delegate.dart';
import '../../providers/index.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final colors = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_outlined,
                color: colors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Cinemapedia',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    final movieRepository = ref.read(movieRepositoryProvider);
                    showSearch<Movie?>(
                            context: context,
                            delegate: SearchMovieDelegate(
                                searchMovie: movieRepository.SearchMovieByName))
                        .then((movie) {
                      if (movie == null) return;
                      context.push('/movie/${movie.id}');
                    });
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
  }
}
