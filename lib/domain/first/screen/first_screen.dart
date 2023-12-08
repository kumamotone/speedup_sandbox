import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedup_sandbox/domain/first/page/main_page.dart';
import 'package:speedup_sandbox/domain/settings/page/settings_page.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
        elevation: 0,
      ),
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: MainPage(),
                  );
                },
              );
            default:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: SettingsPage(),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
