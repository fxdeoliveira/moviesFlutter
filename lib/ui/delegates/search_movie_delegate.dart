import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../config/helpers/dates_format.dart';
import '../../domain/entities/movie.dart';

typedef SearchMovieCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallBack searchMovie;
  List<Movie> initialMovies;

  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  StreamController<bool> isloadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  void clearStreams() {
    debounceMovies.close();
  }

  void clearLoadingStreams() {
    isloadingStream.close();
  }

  void _onQuerySearch(String query) {
    isloadingStream.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 900), () async {
      final movies = await searchMovie(query);
      initialMovies = movies;
      debounceMovies.add(movies);
      isloadingStream.add(false);
    });
  }

  SearchMovieDelegate(
      {required this.searchMovie, this.initialMovies = const []})
      : super(searchFieldLabel: 'Buscar Películas');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isloadingStream.stream,
        builder: (context, snapShot) {
          if (snapShot.data ?? false) {
            return SpinPerfect(
                duration: const Duration(seconds: 20),
                spins: 10,
                child: IconButton(
                    onPressed: () => query = '',
                    icon: const Icon(Icons.refresh_rounded)));
          }
          return FadeIn(
              animate: query.isNotEmpty,
              child: IconButton(
                  onPressed: () => query = '', icon: const Icon(Icons.clear)));
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResultAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQuerySearch(query);
    return _buildResultAndSuggestions();
  }

  Widget _buildResultAndSuggestions() {
    return StreamBuilder(
        initialData: initialMovies,
        stream: debounceMovies.stream,
        builder: ((context, snapshot) {
          final movies = snapshot.data ?? [];

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => _MovieItem(
              movie: movies[index],
              onMovieSelected: (context, movie) {
                clearStreams();
                close(context, movie);
              },
            ),
          );
        }));
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;
  const _MovieItem({
    Key? key,
    required this.movie,
    required this.onMovieSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(children: [
          SizedBox(
            width: size.width * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child)),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textStyles.titleMedium,
                ),
                (movie.overview.length > 100)
                    ? Text('${movie.overview.substring(0, 100)}...')
                    : Text(movie.overview),
                Row(
                  children: [
                    Icon(
                      Icons.star_half_rounded,
                      color: Colors.yellow.shade800,
                    ),
                    const SizedBox(width: 5),
                    Text(DatesFormats.number(movie.voteAverage, 1),
                        style: textStyles.bodyMedium!
                            .copyWith(color: Colors.yellow.shade900)),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
