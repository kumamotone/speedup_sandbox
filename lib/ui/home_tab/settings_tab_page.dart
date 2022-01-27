import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/theming.dart';

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.first);

enum PageType {
  first,
  second,
}

class SettingsTabPage extends HookConsumerWidget {
  const SettingsTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Settings Page', style: boldTextStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                    child: Text('Button', style: boldTextStyle),
                  ),
                ]),
            const Divider(height: 1),
            const Text('Settings Page'),
          ],
        ),
      ),
    );
  }
}
