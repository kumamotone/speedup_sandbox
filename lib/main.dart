import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/theming.dart';
import 'package:speedup_sandbox/ui/root_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const Scaffold(
        body: RootPage(),
      ),
    );
  }
}
