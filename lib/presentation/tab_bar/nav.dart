import 'package:flutter/cupertino.dart';

class Nav {
  final IconData? icon;
  final String? label;

  Nav({this.icon, this.label});

  Nav.fromMap(Map<String, dynamic> json)
      : this(
          icon: json['icon'],
          label: json['label'],
        );
}

List<Nav> navs = [
  Nav(icon: CupertinoIcons.home, label: 'Pairs'),
  Nav(icon: CupertinoIcons.person, label: 'Profile'),
];
