import 'package:cinemapedia/ui/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/index.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-page';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: Center(child: _HomeView()),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayngMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComing.notifier).loadNextPage();
    ref.read(topRated.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayngMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upComing);
    final topRatedMovies = ref.watch(topRated);

    return initialLoading
        ? const FullScreenLoader()
        : CustomScrollView(slivers: [
            const SliverAppBar(
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: CustomAppBar(),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  MoviesSlideShow(movies: slideshowMovies),
                  HorizontalListView(
                    movies: nowPlayingMovies,
                    subtitle: 'Disponible',
                    title: 'Miercoles 14',
                    loadNextPage: () {
                      ref.read(nowPlayngMoviesProvider.notifier).loadNextPage();
                    },
                  ),
                  HorizontalListView(
                    movies: upcomingMovies,
                    subtitle: 'Proximamente',
                    title: 'Este mes',
                    loadNextPage: () {
                      ref.read(upComing.notifier).loadNextPage();
                    },
                  ),
                  HorizontalListView(
                    movies: popularMovies,
                    title: 'Populares',
                    loadNextPage: () {
                      ref.read(popularMoviesProvider.notifier).loadNextPage();
                    },
                  ),
                  HorizontalListView(
                    movies: topRatedMovies,
                    title: 'Mejor Calificadas',
                    subtitle: 'De todos los tiempos',
                    loadNextPage: () {
                      ref.read(topRated.notifier).loadNextPage();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            }, childCount: 1))
          ]);
  }
}
