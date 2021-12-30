import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/application/providers/currency_provider.dart';
import 'package:speedup_sandbox/domain/entities/currency_entity.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  buildList(AsyncValue<List<CurrencyEntity>> currencies) {
    return currencies.when(
      data: (list) => list.isNotEmpty
          ? ListView(
              children: list
                  .map(
                    (CurrencyEntity entity) => Text(entity.name),
                  )
                  .toList(),
            )
          : const Text('empty'),
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => const Text("error"),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencies = ref.watch(currencyFutureProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: buildList(currencies),
      ),
    );
  }
}
