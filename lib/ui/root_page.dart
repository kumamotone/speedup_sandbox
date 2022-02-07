import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);
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
