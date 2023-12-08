import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
        elevation: 0,
      ),
      body: const Center(
        child: Text("Empty"),
      ),
    );
  }
}
