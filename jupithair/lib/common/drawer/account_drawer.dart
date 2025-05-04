// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class AccountDrawer extends StatelessWidget {
  const AccountDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text('CELINE DELMESTRE'),
        ),
        ListTile(
          title: const Text('Compte Jupithair'),
          onTap: () {
            print('Compte Jupithair');
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Changer de compte'),
          onTap: () {
            print('Changer de compte');
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Langue : français'),
          onTap: () {
            print('Langue : français');
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Paramètres'),
          onTap: () {
            print('Paramètres');
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ));
  }
}
