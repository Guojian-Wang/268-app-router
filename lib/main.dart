// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication/authentication_bloc.dart';
import 'router/app_router.dart';

void main() {
  final authBloc = AuthenticationBloc();
  final appRouter = AppRouter(authBloc);

  appRouter.initializeAuthListener();

  runApp(
    BlocProvider(
      create: (context) => authBloc,
      child: MyApp(appRouter: appRouter),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.router,
    );
  }
}