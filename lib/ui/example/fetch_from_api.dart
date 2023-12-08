import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/theming.dart';
import '../../entities/example/currency_entity.dart';
import '../../repositories/example/currency_repository.dart';

class CurrencyListTabPage extends HookConsumerWidget {
  const CurrencyListTabPage({super.key});

  Widget header() {
    return const Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: Text('Currency List', style: boldTextStyle),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.account_circle,
              color: Colors.pink,
              size: 36.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 16.0, 0),
            child: Text('Button', style: boldTextStyle),
          ),
        ]),
      ],
    );
  }

  Widget list(AsyncSnapshot<List<CurrencyEntity>> result) {
    if (result.connectionState != ConnectionState.done) {
      return const Center(child: CircularProgressIndicator());
    }

    if (result.hasError) {
      return const Text("Error");
    }

    final data = result.data;
    if (data != null && data.isNotEmpty) {
      return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (_, index) {
          return Text(data[index].name);
        },
        itemCount: data.length,
        separatorBuilder: (_, index) => const Divider(),
      );
    } else {
      return const Text("No content");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = useFuture(useMemoized(CurrencyRepository.fetch));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: list(result),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
