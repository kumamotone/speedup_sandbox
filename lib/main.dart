import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/routing.dart';
import 'package:speedup_sandbox/theming.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
