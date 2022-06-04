import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:market/presentation/tab_bar/nav.dart';
import 'package:routemaster/routemaster.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabState = CupertinoTabPage.of(context);
    return CupertinoTabScaffold(
        controller: tabState.controller,
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.black,
            activeColor: Colors.orange,
            onTap: (index) {
              if (kDebugMode) {
                print("TAB BAR INDEX SELECTED: $index");
              }
            },
            items: navs
                .map((item) => BottomNavigationBarItem(
                      icon: Icon(item.icon, size: 25),
                      label: item.label,
                    ))
                .toList()),
        tabBuilder: tabState.tabBuilder);
  }
}
