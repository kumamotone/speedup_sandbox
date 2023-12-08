import 'package:flutter/material.dart';
import 'package:speedup_sandbox/domain/home/page/home_page.dart';
import 'package:speedup_sandbox/domain/settings/page/settings_page.dart';

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: Material(
          child: TabBar(
            tabs: <Widget>[
              Tab(text: 'ホーム', icon: Icon(Icons.home)),
              Tab(text: '設定', icon: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
