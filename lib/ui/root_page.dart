import 'package:flutter/material.dart';
import 'package:speedup_sandbox/ui/example/fetch_from_api.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CurrencyListPage(),
                ),
              ),
              title: Text('Item $index'),
            );
          }),
    );
  }
}
