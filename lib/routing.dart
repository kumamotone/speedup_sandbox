import 'package:go_router/go_router.dart';
import 'package:speedup_sandbox/presentation/first_page.dart';
import 'package:speedup_sandbox/presentation/second_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FirstPage(),
    ),
    GoRoute(
      path: '/second_page',
      builder: (context, state) => const SecondPage(),
    ),
  ],
);
