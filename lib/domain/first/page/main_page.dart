import 'package:flutter/material.dart';
import 'package:speedup_sandbox/domain/currency/page/currency_list_page.dart';
import 'package:speedup_sandbox/foundation/extensions/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () => context.push(
              const CurrencyListPage(),
            ),
            title: const Text('通貨リスト'),
          ),
        ],
      ),
    );
  }
}
