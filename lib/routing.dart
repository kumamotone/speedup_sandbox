import 'package:go_router/go_router.dart';
import 'package:speedup_sandbox/ui/example/cupertino_style_tab.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RootPage(),
    ),
  ],
);
