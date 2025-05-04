// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final List<String> titles;
  final ValueChanged<int>? onTap;

  const CustomDrawer({
    Key? key,
    required this.titles,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text('Jupithair'),
        ),
        ...titles.asMap().entries.map((entry) {
          int index = entry.key;
          String title = entry.value;
          return ListTile(
            title: Text(title),
            onTap: () {
              if (onTap != null) {
                onTap!(index);
              }
              print("clicked on $title in drawer");
            },
          );
        }).toList(),
      ],
    );
  }
}
