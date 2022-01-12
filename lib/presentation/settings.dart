import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/application/providers/currency_provider.dart';

import '../theming.dart';

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.first);

enum PageType {
  first,
  second,
}

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  Widget header() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Settings Page', style: boldTextStyle),
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
            const Text('Settings Page'),
          ],
        ),
      ),
    );
  }
}
