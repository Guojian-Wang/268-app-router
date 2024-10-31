// router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../authentication/authentication_bloc.dart';
import '../authentication/authentication_state.dart';
import '../screens/home_shell.dart';
import '../screens/by_author_screen.dart';
import '../screens/by_title_screen.dart';
import '../screens/book_detail_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/login_screen.dart';

class AppRouter {
  final AuthenticationBloc authBloc;

  AppRouter(this.authBloc);

  final ValueNotifier<AuthenticationState> authListenable = ValueNotifier(AuthenticationInitial());

  void initializeAuthListener() {
    authBloc.stream.listen((state) {
      authListenable.value = state;
    });
  }

  GoRouter get router {
    return GoRouter(
      initialLocation: '/',
      refreshListenable: authListenable,
      redirect: (context, state) {
        final isLoggedIn = authBloc.state is AuthenticationLoggedIn;
        final isLoginRoute = state.location == '/login';

        if (isLoggedIn && isLoginRoute) return '/byAuthor';
        if (!isLoggedIn && !isLoginRoute) return '/login';
        return null;
      },
      routes: [
        ShellRoute(
          builder: (context, state, child) => HomeShell(child: child),
          routes: [
            GoRoute(
              path: '/byAuthor',
              name: 'byAuthor',
              builder: (context, state) => ByAuthorScreen(),
            ),
            GoRoute(
              path: '/byAuthor/detail',
              name: 'byAuthorDetail',
              builder: (context, state) {
                final book = state.extra as Map<String, String>;
                return BookDetailScreen(
                  title: book['title']!,
                  author: book['author']!,
                );
              },
            ),
            GoRoute(
              path: '/byTitle',
              name: 'byTitle',
              builder: (context, state) => ByTitleScreen(),
            ),
            GoRoute(
              path: '/byTitle/detail',
              name: 'byTitleDetail',
              builder: (context, state) {
                final book = state.extra as Map<String, String>;
                return BookDetailScreen(
                  title: book['title']!,
                  author: book['author']!,
                );
              },
            ),
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => ProfileScreen(),
            ),
            GoRoute(
              path: '/login',
              name: 'login',
              builder: (context, state) => LoginScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
