import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 70,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Rechercher', suffixIcon: Icon(Icons.search)),
            ),
          ),
        ));
  }
}
