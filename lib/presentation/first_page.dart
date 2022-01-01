import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/application/providers/currency_provider.dart';
import 'package:speedup_sandbox/domain/entities/currency_entity.dart';

class FirstPage extends HookConsumerWidget {
  const FirstPage({Key? key}) : super(key: key);

  Widget _buildList(AsyncValue<List<CurrencyEntity>> asyncValue) {
    return asyncValue.when(
      data: (currencies) => currencies.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (_, index) {
                return Text(currencies[index].name);
              },
              itemCount: currencies.length,
              separatorBuilder: (_, index) => const Divider(),
            )
          : const Text('empty'),
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => const Text("error"),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencies = ref.watch(currencyFutureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: Column(
        children: [
          TextButton(
            onPressed: () => GoRouter.of(context).push('/second_page'),
            child: const Text("Second Page"),
          ),
          const Text("bbb"),
          Flexible(child: _buildList(currencies)),
        ],
      ),
    );
  }
}
