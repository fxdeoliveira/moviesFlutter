import 'package:go_router/go_router.dart';

import '../../ui/index.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/', 
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen()),
]);
