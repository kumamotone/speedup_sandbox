import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/providers.dart';
import 'package:speedup_sandbox/widgets/error/generic_error_view.dart';
import 'package:speedup_sandbox/widgets/loading/generic_loading_view.dart';

class CurrencyListPage extends HookConsumerWidget {
  const CurrencyListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyList = ref.watch(currencyListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency List"),
      ),
      body: currencyList.when(
        data: (data) {
          if (data.isEmpty) {
            return const Text("No content");
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(data[index].name),
              );
            },
            itemCount: data.length,
          );
        },
        error: (object, stackTrace) => const GenericErrorView(),
        loading: () => const GenericLoadingView(),
      ),
    );
  }
}
