import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';

class DiscoverFilter extends StatelessWidget {
  const DiscoverFilter({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> discoveryFilters = [
      'Homme',
      'Femme',
      'Enfant',
      'Afro',
      'Divers'
    ];

    return Container(
      color: BACKGROUND_COLOR,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ...discoveryFilters.map(
              (category) {
                return Center(
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                        child: Text(
                          category,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
