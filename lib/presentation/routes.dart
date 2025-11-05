import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:rockettest/presentation/auth/auth_screen.dart';
import 'package:rockettest/presentation/bloc/auth_bloc.dart';
import 'package:rockettest/presentation/home/home_screen.dart';

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// GoRouter buildRouter(AuthBloc authBloc) {
//   return GoRouter(
//     initialLocation: '/',
//     refreshListenable: _GoRouterRefreshStream(authBloc.stream),
//     redirect: (context, state) {
//       final authState = authBloc.state;
//       final isAuth = authState.isAuthenticated;
//       final isLoading = authState.isLoading;

//       if (isLoading) return null;

//       final loggingIn = state.uri.toString() == '/auth';

//       if (!isAuth) return loggingIn ? null : '/auth';

//       if (loggingIn) return '/home';

//       return null;
//     },
//     routes: [
//       GoRoute(
//         path: '/auth',
//         builder: (context, state) =>
//             BlocProvider.value(value: authBloc, child: const AuthScreen()),
//       ),
//       GoRoute(
//         path: '/home',
//         builder: (context, state) =>
//             BlocProvider.value(value: authBloc, child: const HomeScreen()),
//       ),
//     ],
//   );
// }
GoRouter buildRouter(AuthBloc authBloc) {
  return GoRouter(
    initialLocation: '/auth',
    refreshListenable: _GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final isAuth = authState.isAuthenticated;
      final isLoading = authState.isLoading;

      if (isLoading) return null;

      final isAtAuth = state.matchedLocation == '/auth';

      if (!isAuth && !isAtAuth) return '/auth';

      if (isAuth && isAtAuth) return '/home';

      return null;
    },
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) =>
            BlocProvider.value(value: authBloc, child: const AuthScreen()),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) =>
            BlocProvider.value(value: authBloc, child: const HomeScreen()),
      ),
    ],
  );
}
