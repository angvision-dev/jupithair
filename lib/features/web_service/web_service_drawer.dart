import 'package:flutter/material.dart';
import 'package:jupithair/common/drawer/custom_drawer.dart';

class WebServiceDrawer extends CustomDrawer {
  const WebServiceDrawer({Key? key, ValueChanged<int>? onTap})
      : super(
          key: key,
          titles: const [
            'Rechercher',
            'Types de coiffures',
            'News',
            'Boutique',
            'Contact',
          ],
          onTap: onTap,
        );
}
