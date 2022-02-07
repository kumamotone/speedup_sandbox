import 'package:go_router/go_router.dart';
import 'package:speedup_sandbox/ui/root_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RootPage(),
    ),
  ],
);
