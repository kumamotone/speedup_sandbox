import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/application/providers/currency_provider.dart';
import 'package:speedup_sandbox/domain/entities/currency_entity.dart';

import '../theming.dart';

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.first);

enum PageType {
  first,
  second,
}

class FirstPage extends HookConsumerWidget {
  const FirstPage({Key? key}) : super(key: key);

  Widget header() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const Center(
          child: Text('Home Page', style: boldTextStyle),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencies = ref.watch(currencyFutureProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(),
            const Divider(height: 1),
            TextButton(
              onPressed: () => GoRouter.of(context).push('/second_page'),
              child: const Text("Push Second Page"),
            ),
            const SizedBox(height: 16),
            Flexible(child: _buildList(currencies)),
          ],
        ),
      ),
    );
  }

  Widget _buildList(AsyncValue<List<CurrencyEntity>> asyncValue) {
    return asyncValue.when(
      data: (currencies) => currencies.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
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
}
