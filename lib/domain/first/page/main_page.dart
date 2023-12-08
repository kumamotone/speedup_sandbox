import 'package:flutter/material.dart';
import 'package:speedup_sandbox/domain/currency/page/currency_list_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
      },
    );
  }
}
